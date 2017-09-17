
(with-eval-after-load 'eshell
  (defvar eshell-path-env)
  (dolist (hook '(pyvenv-post-activate-hooks pyvenv-post-deactivate-hooks))
    (add-hook hook                  ; eshell
              (lambda ()
                (let ((path-env (mapconcat (lambda (x) (or x "."))
                                           exec-path
                                           path-separator)))
                  (setq-default eshell-path-env path-env)
                  (dolist (buffer (buffer-list))
                    (with-current-buffer buffer
                      (and (derived-mode-p 'eshell-mode)
                           (setq eshell-path-env path-env)))))))))

(provide 'eshell-config)
