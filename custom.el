(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" default)))
 '(org-html-html5-fancy t)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (symon noflet zpresent zenburn-theme yoshi-theme xterm-color xclip which-key web-mode web-beautify w3m undo-tree transmission tao-theme ssass-mode speed-type sourcerer-theme solarized-theme smooth-scrolling smex resize-window projectile prodigy pomodoro plan9-theme php-mode perspective paredit origami org-trello olivetti nginx-mode multi-term monochrome-theme mmm-mode minimal-theme markdown-mode magithub lua-mode js2-mode inkpot-theme image+ ido-vertical-mode highlight-parentheses gruvbox-theme ggtags flycheck flx-ido fill-column-indicator expand-region emms-player-mpv emmet-mode elpy edit-indirect dired-du diminish cyberpunk-theme color-theme ace-window ace-jump-mode)))
 '(safe-local-variable-values
   (quote
    ((eval progn
	   (defun set-test-project nil "docstring"
		  (elpy-test-pytest-runner
		   (concat
		    (file-name-as-directory
		     (elpy-project-find-projectile-root))
		    "backend/tests")
		   nil nil nil))
	   (setq projectile-project-test-cmd
		 (function set-test-project)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 111 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
