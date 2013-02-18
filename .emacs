(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "latin-1-prefix")
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "SlateBlue" :foreground "LightSlateBlue")))))

(progn
  (set-background-color "Black")
  (set-foreground-color "Ivory")
  (set-border-color "Ivory")
  (set-mouse-color "Ivory")
  (set-face-background 'default "Black")
  (set-face-background 'region "SlateBlue")
  (set-face-background 'highlight "DarkSlateBlue")
  (set-face-background 'modeline "DarkSlateBlue") ;;; CornflowerBlue")
  (set-face-foreground 'default "Ivory")
  (set-face-foreground 'region "Ivory")
  (set-face-foreground 'highlight "LightGray")  ;;; DimGray")
  (set-face-foreground 'modeline "LightGray"))

;;
;; Disable backup
;;
(setq backup-inhibited t)

;;
;; Disable auto save
;;
(setq auto-save-default nil)

;;
;; TAB Completion
;;
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
	   
;;
;; C language hooks
;;
(defun my-c-mode-hook () 
  (setq-default c-default-style "linux"
		tab-width 2
		c-indent-level 2
		c-toggle-auto-state 1
		c-indent-tabs-mode t
		c-argdecl-indent 0
		backward-delet-function nil)
	
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;;
;; Flex & Bison
;;
(autoload 'bison-mode "bison-mode.el")
(add-to-list 'auto-mode-alist '("\\.y\\'" . bison-mode))

(autoload 'flex-mode "flex-mode.el")
(add-to-list 'auto-mode-alist '("\\.l\\'" . flex-mode))

;;
;; nXML
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/html5-el")
(eval-after-load "rng-loc"
  '(add-to-list 'rng-schema-locating-files "~/.emacs.d/site-lisp/html5-el/schemas.xml"))

(require 'whattf-dt)

;;
;; Common Lisp
;;
;; Add .cl files to lisp-mode
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/redshank"))
(autoload 'enable-paredit-mode "paredit"
     "Turn on pseudo-structural editing of Lisp code." t)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(require 'redshank-loader)
(eval-after-load "redshank-loader"
  `(redshank-setup '(lisp-mode-hook
		     slime-repl-mode-hook) t))

;;
;; Python
;;

;; SCons build
(add-to-list 'auto-mode-alist '("SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript\\'" . python-mode))
(add-to-list 'auto-mode-alist '("sconstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.scons\\'" . python-mode))

;;
;; Erlang
;;
(require 'erlang-start)

;;
;; Javascript
;;

;; Add JSON documents to js-mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

;;
;; Scala
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/scala-emacs")
(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
	  '(lambda ()
	     (scala-mode-feature-electric-mode)
	     ))

;;
;; Markdown
;;
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;;
;; Cucumber feature-mode
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/feature-mode-0.4")
(require 'feature-mode)

;;
;; Start the edit server
;;
(require 'edit-server)
(edit-server-start)
