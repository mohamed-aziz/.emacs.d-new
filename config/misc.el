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


(require 'flx-ido)
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

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

(yas-global-mode 1)

(global-highlight-parentheses-mode 1)

(require 'expand-region)
(global-set-key (kbd "C-c =") 'er/expand-region)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; If the *scratch* buffer is killed, recreate it automatically
;; FROM: Morten Welind
;;http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)

(require 'projectile)

(projectile-mode 1)

;; Save backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(provide 'misc)
