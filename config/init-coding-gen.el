;;; init-coding-gen.el --- Code for general programming

;;; Commentary:
;; General tools for programming across languages. This consists of:
;; Company: Code completion
;; Magit: git/github interface
;; Flycheck: syntax checking

;;; Code:

;; == Company Mode ==
(use-package company
  :ensure t
  :defer t
  :after
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay nil
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-dabbrev-downcase nil
        )
  (bind-key "TAB" 'company-complete)
  )

;; == YASnippet ==
(use-package yasnippet
  :ensure t
;; Causes yas not to load - commented out for now
;;:defer t 
  :config (yas-global-mode t)
  )

;; == magit ==
(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status)
  )

;; == flycheck ==
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :defer t
  :init

  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; check OS type
  (if (string-equal system-type "gnu/linux")
      (progn
        (custom-set-variables
         '(flycheck-c/c++-clang-executable "clang-3.5")
         )))
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-gcc))
  )
;;; init-coding-gen.el ends here