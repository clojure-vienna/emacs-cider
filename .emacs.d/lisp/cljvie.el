;;; -*- lexical-binding: t -*-

(defun cljvie-map-bindings (mode-map bindings)
  (mapc
   (lambda (binding)
     (define-key mode-map (kbd (car binding)) (cadr binding)))
   bindings))

(defun cljvie-lisp-mode ()
  (require 'rainbow-delimiters)
  (require 'paredit)
  (enable-paredit-mode)
  (rainbow-delimiters-mode)
  (show-paren-mode))

(defun cljvie-clojure-mode ()
  (require 'cider)
  (require 'clj-refactor)
  (cljvie-map-bindings
   clojure-mode-map
   ("C-c TAB" 'cider-repl-indent-and-complete-symbol))
  (eldoc-mode)
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c r")
  (cljvie-lisp-mode))

(defun cljvie-on-cider-load ()
  (setq cider-repl-wrap-history t)
  (setq cider-repl-history-size 1000)
  (setq cider-repl-history-file "~/.emacs.d/nrepl-history")

  (add-hook 'cider-repl-mode-hook 'subword-mode))

(defun cljvie-startup ()
  ;; Skip startup screen
  (when (string= "*scratch*" (buffer-name (current-buffer)))
    (find-file "~"))
  ;; Mode hooks
  (add-hook 'clojure-mode-hook 'cljvie-clojure-mode)
  (add-hook 'clojurescript-mode-hook 'cljvie-clojure-mode)
  (add-hook 'emacs-lisp-mode-hook 'cljvie-lisp-mode)
  ;; Load hooks
  (eval-after-load "cider" 'cljvie-on-cider-load)
  ;; Issue startup message
  (message "Cljvie configuration loaded. Make yourself @ ~"))

(provide 'cljvie)
