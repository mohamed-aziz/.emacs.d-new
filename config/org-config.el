(require 'org)

(setq org-log-done 'time)


(add-hook 'org-mode-hook '(lambda ()
			    (setq left-margin-width 5)
			    (setq right-margin-width 5)
			    (visual-line-mode)
			    (flyspell-mode)))

;; set the agenda files to my movies and mylife

(setq org-agenda-files (list
			(expand-file-name "~/movie.org")
			(expand-file-name "~/mylife.org")))


(global-set-key (kbd "C-c a") 'org-agenda)
(define-key org-mode-map (kbd "M-RET") 'org-insert-heading)

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(require 'org-trello)

(setq org-trello-files
      '("/home/mo/work.org"))

(provide 'org-config)
