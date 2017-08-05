(require 'dired)
(setq dired-dwim-target t)

(define-key dired-mode-map "b" 'emms-play-dired)

(provide 'dired-config)
