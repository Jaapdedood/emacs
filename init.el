;;; init.el --- Initialization code for emacs

;;; Commentary:
;; Calls my Emacs configuration files after installing use-package, which is
;; necessary for operation.  See also:
;;     http://www.cachestocaches.com/2015/8/getting-started-use-package/
;;
;; Code inspired by:
;;     https://github.com/gjstein/emacs.d/blob/master/init.el

;;; Code:

;; User Info
(setq user-full-name "Jaap de Dood")
(setq user-mail-address "jaap.dood@gmail.com")

;; fixes bug that causes Emacs to hang on M-x package-refresh-contents
(setq package-check-signature nil)

;; Update package-archive lists
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			("marmalade" . "http://marmalade-repo.org/packages/")
			("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; Set the path variable
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; === Document Editing ====
(load-file "~/.emacs.d/config/init-doc-editing.el")

;; === Programming & Coding Functions ===
(load-file "~/.emacs.d/config/init-coding-gen.el")

;; === Web Editing ===
(load-file "~/.emacs.d/config/init-coding-web.el")

;; === C/C++/Arduino Editing ===
(load-file "~/.emacs.d/config/init-coding-c.el")

;; == HDL ===
(load-file"~/.emacs.d/config/init-coding-hdl.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-c/c++-clang-executable "clang-3.5")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-html-tag-bracket-face ((t (:foreground "brightblue")))))
;;; init.el ends here

