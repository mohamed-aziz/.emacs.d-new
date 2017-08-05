(require 'vue-mode)
(require 'emmet-mode)
(require 'web-mode)

(setq js-indent-level 2)

(add-hook 'vue-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(provide 'web-config)
