(require 'org)
(org-babel-tangle-file (concat user-emacs-directory "Knani.org"))
(load-file (concat user-emacs-directory "init.el"))
(byte-compile-file (concat user-emacs-directory "init.el"))
