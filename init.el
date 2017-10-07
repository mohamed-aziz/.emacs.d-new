
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org)
(org-babel-tangle-file (concat user-emacs-directory "Knani.org"))
(load-file (concat user-emacs-directory "Knani.el"))
(byte-compile-file (concat user-emacs-directory "Knani.el"))
