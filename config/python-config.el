
(elpy-enable)

(add-hook 'python-mode-hook
          (lambda ()
            (push '("def" . ?ƒ) prettify-symbols-alist)))

(setenv "WORKON_HOME" "/home/mo/vEnvs/")

(provide 'python-config)
