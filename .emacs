;; Copyright (c) 2011 Etu & Anders Sundman <anders@4zm.org>

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:height 80)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(tab-width 2))

;; Disable menubar, toolbar and scrollbar
(menu-bar-mode -1)
(when (featurep 'x)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; Better bufferswitching
(ido-mode 1)

;; Automatic reloading of open buffers
(global-auto-revert-mode t)

;; Better hilights of  (), {} and []
(require 'paren) (show-paren-mode t)

;; Do autamagic intent after newline
(global-set-key "\C-m" 'newline-and-indent)

;; Clip board interface bindings
(global-set-key "\C-cy" 'clipboard-yank)
(global-set-key "\C-ck" 'clipboard-kill-region)

;; Enable line & column numbers
(global-linum-mode 1)
(column-number-mode 1)
(setq linum-format "%3d ")
(global-set-key (kbd "<f6>") 'linum-mode)

;; Turn off the annoying default backup behaviour
(if (file-directory-p "~/.emacs.d/backup")
    (setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
  (message "Directory does not exist: ~/.emacs.d/backup"))

;; Night/Day mode
(when (featurep 'x)
  (defun night-mode ()
    (interactive)
    (set-background-color "gray10")
    (set-foreground-color "white")
    (message "Night mode on")
    (set-frame-parameter nil 'night-mode-on nil))
  
  (defun day-mode ()
    (interactive)
    (set-background-color "white")
    (set-foreground-color "black")
    (message "Night mode off")
    (set-frame-parameter nil 'night-mode-on t))
  
  (defun toggle-night-mode ()
    (interactive)
    (if (frame-parameter nil 'night-mode-on)
        (night-mode)
      (day-mode)))
  
  (global-set-key [f12] 'toggle-night-mode))

  ;; C-x g Goto Line
  (global-set-key "\C-xg" 'goto-line)

  ;; C Mode
  (add-hook 'c-mode-hook
    (lambda ()
      (font-lock-mode 1)
        (set-variable 'show-trailing-whitespace t)
        (set-variable 'indent-tabs-mode nil)
        (set-variable 'c-basic-offset 2)))
        (auto-fill-mode 1)
          (set (make-local-variable 'fill-nobreak-predicate)
            (lambda ()
              (not (eq (get-text-property (point) 'face)
              'font-lock-comment-face))))