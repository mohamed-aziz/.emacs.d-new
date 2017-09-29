

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (show-paren-mode 1)
				  (paredit-mode 1)))

(provide 'elisp-config)
