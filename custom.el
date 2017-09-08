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
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("5673c365c8679addfb44f3d91d6b880c3266766b605c99f2d9b00745202e75f6" "f23a961abba42fc5d75bf94c46b5688c52683c02b3a81313dd0738b4d48afd1d" "2968a2ef2d6053ef935d6d537b32a94c6bec868706dc937e1049473db9e60645" "417a047001847a55f9e0d9692f2bde644a325ab8a1ef18b22baea8309d9164cb" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "8d3c5e9ba9dcd05020ccebb3cc615e40e7623b267b69314bdb70fe473dd9c7a8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "429028d30a6cc349351417616112c9d9346282ee951c874988199c4a28f952f5" "1bd383f15ee7345c270b82c5e41554754b2a56e14c2ddaa2127c3590d0303b95" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" default)))
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
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (async-await ggtags minimal-theme xclip web-mode web-beautify w3m vue-mode sourcerer-theme solarized-theme smooth-scrolling smex resize-window projectile prodigy pomodoro php-mode origami multi-term monochrome-theme markdown-mode magit js2-mode inkpot-theme ido-vertical-mode highlight-parentheses gruvbox-theme flx-ido expand-region emms-player-mpv emmet-mode elpy color-theme ace-jump-mode)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "")
 '(term-default-fg-color "#839496")
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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#c2c2b0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(dired-header ((t (:foreground "#fdf6e3"))))
 '(magit-blame-heading ((t (:foreground "black"))))
 '(mmm-default-submode-face ((t nil)))
 '(org-todo ((t (:foreground "#aa4450" :box (:line-width 2 :color "yellow" :style released-button)))))
 '(term ((t (:inherit default :foreground "#839496")))))
