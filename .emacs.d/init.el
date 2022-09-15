;; Disable the toolbar
(tool-bar-mode -1)

;; Disable the menu bar
(menu-bar-mode -1)

;; Enable line number
(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; ;; Set up package.el to work with MELPA
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)
;; (package-refresh-contents)
;; 
;; ;; Download evil
;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))
;; 
;; ;; Download ivy
;; (unless (package-installed-p `ivy)
;;   (package-install `ivy))
;; 
;; ;; Download org-bullets
;; (unless (package-installed-p `org-bullets)
;;   (package-install `org-bullets))
;; 
;; ;; Download rainbow-delimiters
;; (unless (package-installed-p `rainbow-delimiters)
;;   (package-install `rainbow-delimiters))
;; 
;; ;; Download org-tree-slide
;; (unless (package-installed-p `org-tree-slide)
;;   (package-install `org-tree-slide))
;; 
;; ;; Download dockerfile-mode
;; (unless (package-installed-p `dockerfile-mode)
;;   (package-install `dockerfile-mode))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes nil)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(dockerfile-mode org-tree-slide rainbow-delimiters evil cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable Ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Load theme
(load-theme 'misterioso)

;; Org agenda
(setq org-agenda-files '("~/org/"))

;; Config org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Config org titles font size
(dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; Config org inline image size
(setq org-image-actual-width nil)

;; Enable rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Defualt shell
(setq-default shell-file-name "/bin/bash")

;; ;; Enable org-tree-slide
;; (require 'org-tree-slide)
;; (with-eval-after-load "org-tree-slide"
;;   (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
;;   (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree))

;; Setup org babel
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell . t)
    (python . t)))

(text-scale-set 0)
