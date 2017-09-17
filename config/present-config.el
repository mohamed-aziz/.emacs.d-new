(require 'zpresent)

(add-hook 'zpresent-mode-hook (lambda ()
				(define-key zpresent-mode-map
				  (kbd "<up>") #'scroll-down)
				(define-key zpresent-mode-map
				  (kbd "<down>") #'scroll-up)))


(provide 'present-config)
