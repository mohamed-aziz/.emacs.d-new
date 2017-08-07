(add-to-list 'load-path
	     (expand-file-name "config" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(require 'misc)
(require 'dired-config)
(require 'music)
(require 'magit)
(require 'python-config)
(require 'web-config)
(require 'xclip)

(require 'sourcerer-theme)
(load-theme 'sourcerer)
(xclip-mode 1)



;; Keybindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; to avoid delay in terminal
(setq-default xterm-query-timeout nil)


(provide 'init)
