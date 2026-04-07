(setq inhibit-startup-message t) ; disable startup screen
(setq use-dialog-box nil)        ; disable GUI dialog boxes
(setq confirm-kill-emacs #'y-or-n-p) ; confirm before exiting.
(setq default-directory  "~/src") ; default working directory.
(setq confirm-nonexistent-file-or-buffer nil) ; do not confirm nonexistent files

(set-face-attribute 'default nil :height 110) ; base font sizes

(add-to-list 'default-frame-alist '(internal-border-width . 20)) ; set window border

;; Window scrolling
(setq scroll-conservatively 101
      scroll-margin 9
      scroll-step 1
      scroll-preserve-screen-position 1)

;; Fringe mode
(set-fringe-mode 10)

;; Org mode
(setq org-directory "~/org/")
(setq org-agenda-files
      (list
       (file-name-concat org-directory "tasks.org")))
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Disable some UI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line number configuration
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width-start t)
(setq display-line-numbers-width 3)

;; Disable line numbers for these modes.
(dolist (mode '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Themes
(use-package doom-themes
  :config
  (load-theme 'doom-dracula t))

;; Completion packages

(use-package all-the-icons
  :if (display-graphic-p)) ;; NOTE: make sure you do `M-x all-the-icons-install-fonts` to install resource files.

(use-package consult
  :init
  (setq consult-project-root-function #'vc-root-dir))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil))

(use-package vertico
  :custom
  (vertico-count 15) ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ; Navigation cycling
  (setq enable-recursive-minibuffers t) ; Recursive minibuffers
  (vertico-grid-separator "         ")
  (vertico-grid-lookahead 50)
  (vertico-buffer-display-action '(display-buffer-reuse-window))
  
  :bind (:map vertico-map
	      ("TAB" . vertico-insert) ; Insert selected candiate into current text area
	      ("C-M-n" . vertico-next-group) ; Cycle next candidate group
	      ("C-M-p" . vertico-prev-group) ; Cycle previous candidate group
	      :map minibuffer-local-map
	      ("ESC" . minibuffer-keyboard-quit)) ; Close the minibuffer
  :config
  (vertico-mode))

(use-package marginalia
  :after vertico
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
 :init
  (marginalia-mode))
 
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

;; Neotree
(use-package neotree
  :init
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
  :custom
  (setq neo-theme (if display-graphic-p) 'icons 'arrow))

;; LSP-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c 1")
  :hook
  (ts-mode . lsp-deffered)
  :commands lsp lsp-deferred)

(use-package lsp-ui :commands: lsp-ui-mode)
(use-package dap-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons all-the-icons-completion auto-complete chicken-scheme
		   consult csharp-mode csv-mode dap-mode doom-themes
		   edit-server emacs-neotree embark erlang
		   feature-mode graphviz-dot-mode haskell-mode
		   indent-bars jinja2-mode js2-mode js3-mode lsp-mode
		   marginalia markdown-mode neotree orderless redshank
		   rspec-mode scss-mode slime uuid vertico virtualenv
		   yaml-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
