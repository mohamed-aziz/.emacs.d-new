
(provide 'org-fix-capture-counsel)

(defun org-capture-fill-template (&optional template initial annotation)
  "Fill a template and return the filled template as a string.
The template may still contain \"%?\" for cursor positioning."
  (let* ((template (or template (org-capture-get :template)))
	 (buffer (org-capture-get :buffer))
	 (file (buffer-file-name (or (buffer-base-buffer buffer) buffer)))
	 (time (let* ((c (or (org-capture-get :default-time) (current-time)))
		      (d (decode-time c)))
		 (if (< (nth 2 d) org-extend-today-until)
		     (encode-time 0 59 23 (1- (nth 3 d)) (nth 4 d) (nth 5 d))
		   c)))
	 (v-t (format-time-string (org-time-stamp-format nil) time))
	 (v-T (format-time-string (org-time-stamp-format t) time))
	 (v-u (format-time-string (org-time-stamp-format nil t) time))
	 (v-U (format-time-string (org-time-stamp-format t t) time))
	 (v-c (and kill-ring (current-kill 0)))
	 (v-x (or (org-get-x-clipboard 'PRIMARY)
		  (org-get-x-clipboard 'CLIPBOARD)
		  (org-get-x-clipboard 'SECONDARY)
		  ""))			;ensure it is a string
	 ;; `initial' and `annotation' might have been passed.  But if
	 ;; the property list has them, we prefer those values.
	 (v-i (or (plist-get org-store-link-plist :initial)
		  (and (stringp initial) (org-no-properties initial))
		  (org-capture-get :initial)
		  ""))
	 (v-a
	  (let ((a (or (plist-get org-store-link-plist :annotation)
		       annotation
		       (org-capture-get :annotation)
		       "")))
	    ;; Is the link empty?  Then we do not want it...
	    (if (equal a "[[]]") "" a)))
	 (l-re "\\[\\[\\(.*?\\)\\]\\(\\[.*?\\]\\)?\\]")
	 (v-A (if (and v-a (string-match l-re v-a))
		  (replace-match "[[\\1][%^{Link description}]]" nil nil v-a)
		v-a))
	 (v-l (if (and v-a (string-match l-re v-a))
		  (replace-match "\\1" nil nil v-a)
		v-a))
	 (v-n user-full-name)
	 (v-k (if (marker-buffer org-clock-marker)
		  (org-no-properties org-clock-heading)
		""))
	 (v-K (if (marker-buffer org-clock-marker)
		  (org-make-link-string
		   (format "%s::*%s"
			   (buffer-file-name (marker-buffer org-clock-marker))
			   v-k)
		   v-k)
		""))
	 (v-f (or (org-capture-get :original-file-nondirectory) ""))
	 (v-F (or (org-capture-get :original-file) ""))
	 (org-capture--clipboards
	  (delq nil
		(list v-i
		      (org-get-x-clipboard 'PRIMARY)
		      (org-get-x-clipboard 'CLIPBOARD)
		      (org-get-x-clipboard 'SECONDARY)
		      v-c))))

    (setq org-store-link-plist (plist-put org-store-link-plist :annotation v-a))
    (setq org-store-link-plist (plist-put org-store-link-plist :initial v-i))

    (unless template
      (setq template "")
      (message "no template") (ding)
      (sit-for 1))
    (save-window-excursion
      (org-switch-to-buffer-other-window (get-buffer-create "*Capture*"))
      (erase-buffer)
      (setq buffer-file-name nil)
      (setq mark-active nil)
      (insert template)
      (goto-char (point-min))

      ;; %[] insert contents of a file.
      (save-excursion
	(while (re-search-forward "%\\[\\(.+\\)\\]" nil t)
	  (let ((filename (expand-file-name (match-string 1)))
		(beg (copy-marker (match-beginning 0)))
		(end (copy-marker (match-end 0))))
	    (unless (org-capture-escaped-%)
	      (delete-region beg end)
	      (set-marker beg nil)
	      (set-marker end nil)
	      (condition-case error
		  (insert-file-contents filename)
		(error
		 (insert (format "%%![couldn not insert %s: %s]"
				 filename
				 error))))))))

      ;; Mark %() embedded elisp for later evaluation.
      (org-capture-expand-embedded-elisp 'mark)

      ;; Expand non-interactive templates.
      (let ((regexp "%\\(:[-a-za-z]+\\|<\\([^>\n]+\\)>\\|[aAcfFikKlntTuUx]\\)"))
	(save-excursion
	  (while (re-search-forward regexp nil t)
	    ;; `org-capture-escaped-%' may modify buffer and cripple
	    ;; match-data.  Use markers instead.  Ditto for other
	    ;; templates.
	    (let ((pos (copy-marker (match-beginning 0)))
		  (end (copy-marker (match-end 0)))
		  (value (match-string 1))
		  (time-string (match-string 2)))
	      (unless (org-capture-escaped-%)
		(delete-region pos end)
		(set-marker pos nil)
		(set-marker end nil)
		(let* ((inside-sexp? (org-capture-inside-embedded-elisp-p))
		       (replacement
			(pcase (string-to-char value)
			  (?< (format-time-string time-string time))
			  (?:
			   (or (plist-get org-store-link-plist (intern value))
			       ""))
			  (?i
			   (if inside-sexp? v-i
			     ;; Outside embedded Lisp, repeat leading
			     ;; characters before initial place holder
			     ;; every line.
			     (let ((lead (buffer-substring-no-properties
					  (line-beginning-position) (point))))
			       (replace-regexp-in-string "\n\\(.\\)"
							 (concat lead "\\1")
							 v-i nil nil 1))))
			  (?a v-a)
			  (?A v-A)
			  (?c v-c)
			  (?f v-f)
			  (?F v-F)
			  (?k v-k)
			  (?K v-K)
			  (?l v-l)
			  (?n v-n)
			  (?t v-t)
			  (?T v-T)
			  (?u v-u)
			  (?U v-U)
			  (?x v-x))))
		  (insert
		   (if inside-sexp?
		       ;; Escape sensitive characters.
		       (replace-regexp-in-string "[\\\"]" "\\\\\\&" replacement)
		     replacement))))))))

      ;; Expand %() embedded Elisp.  Limit to Sexp originally marked.
      (org-capture-expand-embedded-elisp)

      ;; Expand interactive templates.  This is the last step so that
      ;; template is mostly expanded when prompting happens.  Turn on
      ;; Org mode and set local variables.  This is to support
      ;; completion in interactive prompts.
      (let ((org-inhibit-startup t)) (org-mode))
      (org-clone-local-variables buffer "\\`org-")
      (let (strings)			; Stores interactive answers.
	(save-excursion
	  (let ((regexp "%\\^\\(?:{\\([^}]*\\)}\\)?\\([CgGLptTuU]\\)?"))
	    (while (re-search-forward regexp nil t)
	      (let* ((items (and (match-end 1)
				 (save-match-data
				   (split-string (match-string-no-properties 1)
						 "|"))))
		     (key (match-string 2))
		     (beg (copy-marker (match-beginning 0)))
		     (end (copy-marker (match-end 0)))
		     (prompt (nth 0 items))
		     (default (nth 1 items))
		     (completions (nthcdr 2 items)))
		(unless (org-capture-escaped-%)
		  (delete-region beg end)
		  (set-marker beg nil)
		  (set-marker end nil)
		  (pcase key
		    ((or "G" "g")
		     (my/set-tags))
		    ((or "C" "L")
		     (let ((insert-fun (if (equal key "C") #'insert
					 (lambda (s) (org-insert-link 0 s)))))
		       (pcase org-capture--clipboards
			 (`nil nil)
			 (`(,value) (funcall insert-fun value))
			 (`(,first-value . ,_)
			  (funcall insert-fun
				   (read-string "Clipboard/kill value: "
						first-value
						'org-capture--clipboards
						first-value)))
			 (_ (error "Invalid `org-capture--clipboards' value: %S"
				   org-capture--clipboards)))))
		    ("p" (org-set-property prompt nil))
		    ((or "t" "T" "u" "U")
		     ;; These are the date/time related ones.
		     (let* ((upcase? (equal (upcase key) key))
			    (org-end-time-was-given nil)
			    (time (org-read-date upcase? t nil prompt)))
		       (org-insert-time-stamp
			time (or org-time-was-given upcase?)
			(member key '("u" "U"))
			nil nil (list org-end-time-was-given))))
		    (`nil
		     ;; Load history list for current prompt.
		     (setq org-capture--prompt-history
			   (gethash prompt org-capture--prompt-history-table))
		     (push (org-completing-read
			    (concat (or prompt "Enter string")
				    (and default (format " [%s]" default))
				    ": ")
			    completions
			    nil nil nil 'org-capture--prompt-history default)
			   strings)
		     (insert (car strings))
		     ;; Save updated history list for current prompt.
		     (puthash prompt org-capture--prompt-history
			      org-capture--prompt-history-table))
		    (_
		     (error "Unknown template placeholder: \"%%^%s\""
			    key))))))))

	;; Replace %n escapes with nth %^{...} string.
	(setq strings (nreverse strings))
	(save-excursion
	  (while (re-search-forward "%\\\\\\([1-9][0-9]*\\)" nil t)
	    (unless (org-capture-escaped-%)
	      (replace-match
	       (nth (1- (string-to-number (match-string 1))) strings)
	       nil t)))))

      ;; Make sure there are no empty lines before the text, and that
      ;; it ends with a newline character.
      (skip-chars-forward " \t\n")
      (delete-region (point-min) (line-beginning-position))
      (goto-char (point-max))
      (skip-chars-backward " \t\n")
      (delete-region (point) (point-max))
      (insert "\n")

      ;; Return the expanded template and kill the capture buffer.
      (untabify (point-min) (point-max))
      (set-buffer-modified-p nil)
      (prog1 (buffer-substring-no-properties (point-min) (point-max))
	(kill-buffer (current-buffer))))))


;;  complete from all agenda files as default behavior due to bug to the procedure
(defun counsel-org-tag ()
  "Add or remove tags in `org-mode'."
  (interactive)
  (save-excursion
    (if (eq major-mode 'org-agenda-mode)
        (if org-agenda-bulk-marked-entries
            (setq counsel-org-tags nil)
          (let ((hdmarker (or (org-get-at-bol 'org-hd-marker)
                              (org-agenda-error))))
            (with-current-buffer (marker-buffer hdmarker)
              (goto-char hdmarker)
              (setq counsel-org-tags
                    (split-string (org-get-tags-string) ":" t)))))
      (unless (org-at-heading-p)
        (org-back-to-heading t))
      (setq counsel-org-tags (split-string (org-get-tags-string) ":" t)))
    (let ((org-setting-tags t)
          (org-last-tags-completion-table
           (append org-tag-persistent-alist
		   (org-global-tags-completion-table
		    (org-agenda-files)))))
      (ivy-read (counsel-org-tag-prompt)
                (lambda (str &rest _unused)
                  (delete-dups
                   (all-completions str 'org-tags-completion-function)))
                :history 'org-tags-history
                :action 'counsel-org-tag-action
                :caller 'counsel-org-tag))))

(defun my/set-tags (&optional v1 v2)
     (interactive "P")
     (counsel-org-tag))

(fset 'org-set-tags-command 'my/set-tags)
