;;; init-coding-c.el --- Code for C/C++/Arduino programming

;;; Commentary:
;; Modes and functions for C/C++/Arduino Programming
;; Arduino-mode - .ino/.pde editing support
;; TBD

;;; Code:

;; == Arduino-mode ==
(use-package arduino-mode
  :ensure t
  :defer t
  :config
  (setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode)
                              auto-mode-alist))
  (autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
)
;;; init-coding-c.el ends here