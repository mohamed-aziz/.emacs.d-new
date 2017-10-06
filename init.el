(add-to-list 'load-path
	     (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path
	     (expand-file-name "~/.local/usr/local/share/emacs/site-lisp/emms"))
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(setenv "PATH" (concat (getenv "PATH") (concat ":" (expand-file-name "~/.local/bin"))))
(setq exec-path (append exec-path '("/home/mo/.local/bin")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

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

(setq tls-program "gnutls-cli")

(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python -m certifi")))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile))))


;; load theme
(add-hook 'after-init-hook (lambda ()
			     (require 'tao-yin-theme)
			     (load-theme 'tao-yin)))


(package-initialize)

(require 'misc)
(require 'dired-config)
(require 'music)
(require 'python-config)
(require 'web-config)
(require 'org-config)
(require 'pomodoro-config)
(require 'mail-config)
(require 'erc-config)
(require 'engine-search)
(require 'elisp-config)
(require 'eshell-config)
(require 'present-config)
(require 'perspective-config)

(when (file-exists-p custom-file)
  (load custom-file))


(provide 'init)
;;; init.el ends here
