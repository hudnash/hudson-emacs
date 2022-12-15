;;;; HUDSON'S CONFIG 0.0 [AUG 16 22]
;;;; Thanks to Sacha Chua and Josh Stella
;;; Preliminary Things
;; let's direct emacs to the load-path heree
;(add-to-list 'load-path "~/.emacs.d/lisp/")
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(custom-enabled-themes '(gruvbox-theme))
; '(package-selected-packages '(gruvbox-theme elpy jedi ace-window)))
;;; Josh Stella's configuration
;; set up Ido mode
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(require `ido)(setq ido-enable-flex-matching t)(setq ido-everywhere t)(ido-mode 1)
;; set up Org mode
(setq org-startup-indented t)(setq org-startup-folded "showall")(setq org-directory "~/org")
;; set up Ace Jump mode
;(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")(require 'ace-jump-mode)(define-key global-map (kbd "C-c C-SPC" ) 'ace-jump-mode)OP
;;; Sacha Chua's configuration
;; system information
(defvar my-laptop-p (equal (system-name) "hudsons-macbook-air"))
(defvar my-server-p (and (equal (system-name) "localhost") (equal user-login-name "hudson")))
(global-auto-revert-mode)  ; simplifies syncing
;; personal information
(setq user-full-name "Hudson Nash"
user-mail-address "jhudsonnash@gmail.com")
;; emacs initialization
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(unless (assoc-default "nongnu" package-archives)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t))
; go to last used buffers
(desktop-save-mode 1)
; debugging to occur on errors in the bar
(setq debug-on-error t)
;;; My own package/mode configurations
;; Jedi - autocompletion for Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; Elpy
(elpy-enable)  
(setq elpy-rpc-backend "jedi") 
; anything before this line is unoriginal elisp
;; linuxhint.com (Zeemon Memon) config
; darker theme and user friendly better-defaults package
(defvar myPackages
  '(better-defaults
    )
 )
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)
(setq inhibit-startup-message t)            
(global-linum-mode t)
;;;; Mastering Emacs configs:
;;; configuring the *scratch* buffer:
(defun mp-elisp-mode-eval-buffer ()
  (interactive)
  (message "Evaluated buffer")
  (eval-buffer))
(define-key emacs-lisp-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)
(define-key lisp-interaction-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)
;;;; System Crafters configs:
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))
;(add-to-list 'load-path "Dropbox/.emacs.d/gruvbox-theme/gruvbox-light-soft-theme.el")
;(require 'gruvbox-light-soft-theme)
;(load 'gruvbox-light-soft-theme)  ;; requires that zenburn.el is in your load path
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (color-theme-gruvbox-light-soft-theme)))
;; doom-modeline
;(require 'doom-modeline)
					;(doom-modeline-mode 1)
(load-theme 'gruvbox t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-roam-ui magit use-package org-static-blog org-clock-today mermaid-mode jupyter gited org-roam material-theme jedi gruvbox-theme elpy better-defaults ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;; #TODO Create a summary section of extensions, what they do, and documentation
;; Jupyter - create and edit on Jupyter notebooks
;; Gited - edit git branches like in dired
;; mermaid-mode
;;;; #TODO Desired features list
;; 0- org-static-blog --> create a static blog with my org notes
;; 1- org-dropbox --> Automatically import notes and assignments from linked directories into Org
;; 2- org-drill --> self-testing using spaced repetition
;; 3- org-if --> interactive fiction authoring system for org
;; 4- org-noter --> Synchronized, org-mode, document annotator
;; 5- Write by Stylus Labs --> iPad app allowing for more advanced Org mode note taking experience
;; 6- bibtex in Org mode --> keep references in Org instead of Zotero
;; 7- Zotero in Org mode --> link Zotero references with annotations to an Org file
;; 8- Zotero-to-Org syncer --> download all Zotero data to Org reference manager (to continue reaping benefits of both Zotero Connector extensions and Zotero Annotator)
;; 9- org-projectile
;; 10- RANDOM PROB / org-randomnote/todo --> show me a random problem to solve for practice
;; (use M-x package list to browse available packages!)

;;;; Org-Mode
;;; Suggested config changes:
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
