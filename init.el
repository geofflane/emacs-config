(setq user-full-name "Geoff Lane")
(setq user-mail-address "geoff@zorched.net")
(set-fill-column 120)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-ruby
                      cider
                      clojure-mode
                      clojure-test-mode
                      color-theme-solarized
                      evil
                      surround
                      paredit
                      evil-paredit
                      ag
                      rainbow-delimiters
                      flycheck
                      coffee-mode
                      go-mode
                      haskell-mode
                      sass-mode
                      slim-mode
                      yaml-mode
                      dirtree))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Because yeah, I'm that guy
(global-surround-mode 1)
(evil-mode 1)

;; solarized is the one-true-colorscheme
(load-theme 'solarized-dark t)

;; line numbers are required
(global-linum-mode 1)
(set-default 'truncate-lines t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(whitespace-line-column 120 t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitepace-tab ((t nil)))
 '(whitespace-line ((t nil)) t))


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
(add-hook 'clojure-mode-hook 'evil-paredit-mode)

;; Dirtree because NERDTree
(require 'dirtree)

