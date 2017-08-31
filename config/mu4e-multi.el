;; Adapted from https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html

(defvar my/mu4e-last-read-account "")

(defun my/mu4e-set-account ()
  "Set the account for composing a message."
  (interactive)
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (if (string= (car var) my/mu4e-last-read-account)
							       (format "[%s]" (car var))
								       (car var)))
                                                my/mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my/mu4e-account-alist)
                             nil t nil nil (caar my/mu4e-account-alist))))
         (account-vars (cdr (assoc account my/mu4e-account-alist))))
    (progn
      (setq my/mu4e-last-read-account account)
      (if account-vars
	  (mapc #'(lambda (var)
		    (set (car var) (cadr var)))
		account-vars)
	(error "No email account found")))))

;; (add-hook 'mu4e-compose-pre-hook 'my/mu4e-set-account)

(defun my/compose-new ()
  "Compose new email"
  (interactive)
  (my/mu4e-set-account)
  (mu4e-compose-new))

(global-set-key (kbd "C-x c") 'my/mu4e-set-account)

(provide 'mu4e-multi)
