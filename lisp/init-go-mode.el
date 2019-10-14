(require 'go-mode)


(setq gofmt-command "goimports")

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(require 'company-go)
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-to-list (make-local-variable 'company-backends)
			 '(company-go company-files company-yasnippet company-capf))))

(require 'go-eldoc)
(add-hook 'go-mode-hook #'go-eldoc-setup)

(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(require 'go-rename)



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