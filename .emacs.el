(package-initialize)

;; Enable line mode
(global-linum-mode t)

;; Enable column number mode
(column-number-mode t)

(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;; Set tab width
;;(setq tab-width 2) ; or any other preferred value

;;(defvaralias 'c-basic-offset 'tab-width)

;; enable smooth scrolling
(smooth-scrolling-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#2f2f2f" :foreground "color-246"))))
 '(which-func ((t (:foreground "brightgreen")))))

;; which function
(which-func-mode t)

;; Highlight current line
(hlinum-activate)

;; Show matching Parenthesiss
(show-paren-mode 1)

;; Fix for slow emacs when saving files
(setq vc-handled-backends nil)

;; Enable Auto Indentation
(electric-indent-mode 1)

;; Mouse mode on
(xterm-mouse-mode t)

;; load theme here
(load-theme 'material t)

;; elpy mode - Python
(elpy-enable)
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

;; pep8 compliace
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Add cargo for Rust
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; Rust Setup
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;; Rust source PATH
(setq racer-rust-src-path "/Users/bahalr/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src") 
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'flycheck)
(require 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; ido mode for buffer management
(progn
  (require 'ido)
  ;; make buffer switch command do suggestions, also for find-file command
  (ido-mode 1)
  ;; (ido-everywhere 1)
  (if ; make ido display choices vertically
      (version< emacs-version "25")
      (progn
	(make-local-variable 'ido-separator)
        (setq ido-separator "\n"))
    (progn
      (make-local-variable 'ido-decorations)
      (setf (nth 2 ido-decorations) "\n")))
  (setq ido-enable-flex-matching t) ; show any name that has the chars you typed
  (setq ido-default-file-method 'selected-window) ; use current pane for newly opened file
  (setq ido-default-buffer-method 'selected-window) ; use current pane for newly switched buffer
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil) ; stop ido from suggesting when naming new file
  )


;; big minibuffer height, for ido to show choices vertically
(setq max-mini-window-height 0.5)
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(fci-rule-color "#3a3a3a")
 '(hl-sexp-background-color "#121212")
 '(package-selected-packages
   (quote
    (list-packages-ext racer cargo rust-mode py-autopep8 elpy material-theme jedi hlinum smooth-scrolling)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))


;; Navigation in emacs windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Install Jedi for Python Autocomplete
;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(autoload 'jedi:setup "jedi" nil t)
(jedi:install-server)

(global-flycheck-mode)

