(require 'dired)
(require 'dired-fixups)
(require 'dired-async)

(setq dired-dwim-target t)

(define-key dired-mode-map "b" 'emms-play-dired)
(define-key dired-mode-map (kbd "C-c f") 'find-name-dired)


(setq dired-listing-switches "-lah")

;; from https://stackoverflow.com/questions/4448055/download-a-file-with-emacs-lisp
(require 'url)

(defun download-file (&optional url download-dir download-name)
  (interactive)
  (let ((url (or url
                 (read-string "Enter download URL: "))))
    (let ((download-buffer (url-retrieve-synchronously url)))
      (save-excursion
        (set-buffer download-buffer)
        ;; we may have to trim the http response
        (goto-char (point-min))
        (re-search-forward "^$" nil 'move)
        (forward-char)
        (delete-region (point-min) (point))
        (write-file (concat (or default-directory
				download-dir
				"~/Downloads"
                            (or download-name
                                (car (last (split-string url "/" t)))))))))))


;; some functions to "normalize" filenames
(defun normalize-name (filename)
  "Replace space with underscore"
  (replace-regexp-in-string " " "_" filename))

(defun dired-do-rename-file ()
  "Call dired-rename-file"
  (let ((file (dired-get-filename nil t)))
    (dired-rename-file file (normalize-name file) nil)))

(defun dired-normalize-name (&optional arg)
  "Normalize files from dired"
  (interactive "P")
  (dired-map-over-marks-check (function dired-do-rename-file) arg 'normalize t)
  (revert-buffer))


(dired-async-mode 1)


(provide 'dired-config)
