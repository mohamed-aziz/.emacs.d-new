(tool-bar-mode   0)
(menu-bar-mode   0)
(scroll-bar-mode 0)

(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)


;; for org-mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;; prettify mode
(global-prettify-symbols-mode 1)
(add-hook 'find-file-hook
	  (lambda ()
	    (push '("!="      . ?≠) prettify-symbols-alist)
	    (push '("<="      . ?≤) prettify-symbols-alist)
	    (push '(">="      . ?≥) prettify-symbols-alist)
	    (push '("alpha"   . ?α) prettify-symbols-alist)
	    (push '("beta"    . ?β) prettify-symbols-alist)
	    (push '("gamma"   . ?γ) prettify-symbols-alist)
	    (push '("delta"   . ?Δ) prettify-symbols-alist)
	    (push '("epsilon" . ?ε) prettify-symbols-alist)
	    (push '("theta"   . ?θ) prettify-symbols-alist)
	    (push '("pi"      . ?π) prettify-symbols-alist)
	    (push '("sqrt"    . ?√) prettify-symbols-alist)))

(setq prettify-symbols-unprettify-at-point t)

;; fuck with Vi(m) users
(defconst wq "This is not vi retard!  Use C-x C-c instead.")
(defconst w "This is not vi retard!  Use C-x C-s instead.")
(defconst q! "This is EMACS not vi retard!  Use C-x C-c instead.")
(defconst wq! "This is EMACS not vi retard!  Use C-x C-c instead.")

(ido-mode 1)

;; To increment number at point like Vim
(defun number-at-point (fn)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (funcall fn (string-to-number (match-string 0))))))

(defun increment-number-at-point()
  (interactive)
  (number-at-point '1+))

(defun decrement-number-at-point()
  (interactive)
  (number-at-point '1-))

(global-set-key (kbd "C-c +") 'increment-number-at-point)
(global-set-key (kbd "C-c -") 'decrement-number-at-point)

;; easily resize

(require 'resize-window)
(global-set-key (kbd "C-c ;") 'resize-window)

(winner-mode 1)

(provide 'misc)
