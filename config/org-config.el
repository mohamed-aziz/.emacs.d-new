

(setq org-log-done 'time)

(add-hook 'org-mode-hook '(lambda ()
			    (setq left-margin-width 5)
			    (setq right-margin-width 5)
			    (visual-line-mode)))

;; set the agenda files to my movies and mylife

(setq org-agenda-files (list
			(expand-file-name "~/movie.org")
			(expand-file-name "~/mylife.org")))

;;(define-key org-mode-map (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'org-config)
