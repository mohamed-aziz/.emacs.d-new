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


(provide 'misc)
