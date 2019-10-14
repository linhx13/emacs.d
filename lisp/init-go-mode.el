(require 'go-mode)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))


(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)
(add-hook 'flymake-mode-hook
      (lambda()
        (local-set-key (kbd "C-c C-e n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
      (lambda()
        (local-set-key (kbd "C-c C-e p") 'flymake-goto-prev-error)))
(add-hook 'flymake-mode-hook
      (lambda()
        (local-set-key (kbd "C-c C-e m") 'flymake-popup-current-error-menu)))

(provide 'init-go-mode)