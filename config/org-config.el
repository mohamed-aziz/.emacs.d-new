

(setq org-log-done 'time)

(add-hook 'org-mode-hook '(lambda ()
			    (setq left-margin-width 5)
			    (setq right-margin-width 5)
			    (visual-line-mode)))

(provide 'org-config)
