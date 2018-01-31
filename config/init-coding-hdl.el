;;; init-coding-hdl.el --- Code for Verilog HDL tools

;;; Commentary:
;; Tools and configurations for Verilog HDL.  This consists of:
;; verilog-mode: de mode

;;; Code:

;; == verilog-mode ==
(use-package verilog-mode
  :ensure t
  :defer t
  :mode (("\\.[st]*v[hp]*\\'" . verilog-mode) ;.v, .sv, .svh, .tv, .vp
         ("\\.psl\\'"         . verilog-mode)
         ("\\.vams\\'"        . verilog-mode)
         ("\\.vinc\\'"        . verilog-mode))
  )
;;; init-coding-hdl.el ends here
