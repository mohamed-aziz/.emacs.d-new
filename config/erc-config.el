(require 'erc)
(require 'erc-log)

;; where to log
(setq erc-log-channels-directory "~/.erc/logs/")

(erc-truncate-mode +1)

(erc-spelling-mode 1)

;; use unicode always
(setq erc-server-coding-system '(utf-8 . utf-8))


;; channels to automatically join to
(setq erc-autojoin-channels-alist '(("freenode.net" "#python"
                                     "#python-eve"
                                     "#pocoo"
                                     "#emacs"
                                     "#gnu"
                                     "#django"
                                     "##programming")))


(provide 'erc-config)
