(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-jump-face-foreground ((t (:foreground "yellow" :underline nil))))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector ["black" "light gray" "dark gray" "light slate gray"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (yoshi)))
 '(custom-safe-themes
   (quote
    ("6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "2cf7f9d1d8e4d735ba53facdc3c6f3271086b6906c4165b12e4fd8e3865469a6" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "5673c365c8679addfb44f3d91d6b880c3266766b605c99f2d9b00745202e75f6" "f23a961abba42fc5d75bf94c46b5688c52683c02b3a81313dd0738b4d48afd1d" "2968a2ef2d6053ef935d6d537b32a94c6bec868706dc937e1049473db9e60645" "417a047001847a55f9e0d9692f2bde644a325ab8a1ef18b22baea8309d9164cb" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "8d3c5e9ba9dcd05020ccebb3cc615e40e7623b267b69314bdb70fe473dd9c7a8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "429028d30a6cc349351417616112c9d9346282ee951c874988199c4a28f952f5" "1bd383f15ee7345c270b82c5e41554754b2a56e14c2ddaa2127c3590d0303b95" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" default)))
 '(elpy-rpc-backend "jedi")
 '(fci-rule-color "#073642" t)
 '(find-name-arg "-iname")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("/home/mo/mylife.org" "/home/mo/movie.org")))
 '(org-fontify-whole-heading-line t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (diminish "diminish-mode" "diminish" yoshi-theme perspective undo-tree which-key dired-du plan9-theme org-parser org-trello flycheck magithub xterm-color lua-mode nginx-mode cyberpunk-theme zenburn-theme async-await ggtags minimal-theme xclip web-mode web-beautify w3m sourcerer-theme solarized-theme smooth-scrolling smex resize-window projectile prodigy pomodoro php-mode origami multi-term monochrome-theme markdown-mode magit js2-mode inkpot-theme ido-vertical-mode highlight-parentheses gruvbox-theme flx-ido expand-region emms-player-mpv emmet-mode elpy color-theme ace-jump-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
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
		 (function set-test-project)))
     (eval progn
	   (defun set-test-project nil "docstring"
		  (elpy-test-pytest-runner
		   (concat
		    (file-name-as-directory
		     (elpy-project-find-projectile-root))
		    "backend/tests")
		   nil nil nil))
	   (setq projectile-project-test-cmd
		 (quote set-test-project)))
     (eval progn
	   (defun set-test-project nil "docstring"
		  (elpy-test-pytest-runner
		   (concat
		    (file-name-as-directory
		     (elpy-project-find-projectile-root))
		    "backend/tests")
		   nil nil nil))
	   (setq projectile-test-cmd
		 (quote set-test-project)))
     (eval progn
	   (defun set-test-project nil "docstring"
		  (elpy-test-pytest-runner
		   (concat
		    (file-name-as-directory
		     (elpy-project-find-projectile-root))
		    "backend/tests")
		   nil nil nil))
	   (setq projectile-test-cmd
		 (function set-test-project)))
     (eval progn
	   (defun my-project-config
	       (args)
	     "docstring"
	     (defun set-test-project nil "docstring"
		    (elpy-test-pytest-runner
		     (concat
		      (file-name-as-directory
		       (elpy-project-find-projectile-root))
		      "backend/tests")
		     nil nil nil))
	     (setq projectile-test-cmd
		   (function test-project))))
     (eval progn
	   (defun set-test-project nil "docstring"
		  (elpy-test-pytest-runner
		   (concat
		    (file-name-as-directory
		     (elpy-project-find-projectile-root))
		    "backend/tests")
		   nil nil nil))
	   (setq projectile-test-cmd
		 (function test-project))))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(term-default-bg-color "")
 '(term-default-fg-color "#839496")
 '(tls-checktrust t)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c3c373730000")
     (60 . "#b9b97d7d0000")
     (80 . "#b58900")
     (100 . "#a24c87870000")
     (120 . "#9b9b87870000")
     (140 . "#94e987870000")
     (160 . "#8e3887870000")
     (180 . "#859900")
     (200 . "#5a5a94e92d2c")
     (220 . "#43c39b9b43c3")
     (240 . "#2d2da24c5a59")
     (260 . "#1696a8fd70f0")
     (280 . "#2aa198")
     (300 . "#00009f9fa7a7")
     (320 . "#00009797b7b7")
     (340 . "#00008f8fc7c7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(window-divider-default-right-width 1)
 '(window-divider-mode t)
 '(xclip-mode t)
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :family "Bitstream Vera Sans Mono"))))
 '(dired-header ((t (:foreground "#fdf6e3"))))
 '(emms-playlist-selected-face ((t (:foreground "SteelBlue3" :underline t))))
 '(magit-blame-heading ((t (:foreground "black"))))
 '(mmm-default-submode-face ((t nil)))
 '(org-todo ((t (:foreground "#aa4450" :box (:line-width 2 :color "yellow" :style released-button)))))
 '(term ((t (:inherit default)))))
