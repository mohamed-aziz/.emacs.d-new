

(require 'perspective)

(setq persp-initial-frame-name "dev")
(persp-mode t)


(with-perspective "music"
  (emms-smart-browse))

;; (persp-switch "irc")
(with-perspective "email"
  (mu4e)
  ;; the easy way, feasible also with emacs-async
  (sleep-for 1))

(with-perspective "files"
  (dired "~/"))

(with-perspective "org"
  (org-agenda-list)
  (sleep-for 1)
  (delete-other-windows)
  (switch-to-buffer "*Org Agenda*"))

(with-perspective "eshell"
  (eshell))

(require 'proced)
(with-perspective "proced"
  (proced)
  (delete-other-windows)
  (switch-to-buffer "*Proced*"))

(provide 'perspective-config)
