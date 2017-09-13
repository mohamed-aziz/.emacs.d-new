(add-to-list 'load-path
	     (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path
	     (expand-file-name "~/.local/usr/local/share/emacs/site-lisp/emms"))
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(setenv "PATH" (concat (getenv "PATH") (concat ":" (expand-file-name "~/.local/bin"))))
(setq exec-path (append exec-path '("/home/mo/.local/bin")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://orgmode.org/elpa/")))
  (add-to-list 'package-archives (cons "org" url) t))


(when (< emacs-major-version 24)
  (add-to-list 'package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
				   ("org" . "https://orgmode.org/elpa/"))))
(package-initialize)

(require 'misc)
(require 'dired-config)
(require 'music)
(require 'magit)
(require 'python-config)
(require 'web-config)
(require 'org-config)
(require 'pomodoro-config)
(require 'xclip)
(require 'mail-config)
(require 'erc-config)
(require 'engine-search)
(require 'elisp-config)

(xclip-mode 1)

(add-hook 'after-init-hook (lambda ()
			     (require 'cyberpunk-theme)
			     (load-theme 'cyberpunk)))

;; Keybindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; to avoid delay in terminal
(setq-default xterm-query-timeout nil)

;; when using nowindow
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])

;; let the terminal decide the background color
(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))

(provide 'init)
(put 'magit-clean 'disabled nil)
