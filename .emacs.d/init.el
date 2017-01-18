;;; -*- lexical-binding: t -*-

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode nil nil (fringe))
 '(global-undo-tree-mode t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(recentf-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'cljvie)

(cljvie-map-bindings
 global-map
 '(;;; Vim inspired window movement
   ;; ("M-h" windmove-left)
   ;; ("M-j" windmove-down)
   ;; ("M-k" windmove-up)
   ;; ("M-l" windmove-right)
   
   ;;; More Modes
   ;; ("M-x" smex)
   ;; ("C-x g" magit)
   ;; ("C-x C-b" ibuffer)

   ("M-L" (lambda () (interactive) (insert-string "λ")))
   ("C-c q" bury-buffer)
   ("C-c n" make-frame)
   ("C-+" text-scale-increase)
   ("C--" text-scale-decrease)
   ("C-h C-f" find-function)
   ("C-M-:" shell-command)))

(add-hook 'emacs-startup-hook 'cljvie-startup)

(require 'presentation)

(cljvie-map-bindings
 global-map
 '(("M-[" presentation-prev-page)
   ("M-]" presentation-next-page)))
