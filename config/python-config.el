
(elpy-enable)

(add-hook 'python-mode-hook
          (lambda ()
            (push '("def" . ?ƒ) prettify-symbols-alist)
	    (push '("sum" . ?∑) prettify-symbols-alist)
	    (push '("**2" . ?²) prettify-symbols-alist)
	    (push '("**3" . ?³) prettify-symbols-alist)))

(setenv "WORKON_HOME" "/home/mo/vEnvs/")

(provide 'python-config)
