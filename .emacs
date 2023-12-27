;; ==================== Improve startup time ====================
;; Garbage collection: save about 0.5s
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))


;; ==================== Appearance ====================
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Font family
(set-face-attribute
 'default nil
 :font "JetBrains Mono-16")
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font t charset "思源黑体"))

;; Show line number
(global-display-line-numbers-mode t)

;; Show column number in the mode line
(column-number-mode t)

;; Change the cursor style
(setq-default cursor-type 'bar)

;; Remove the gaps on maximizing the frame
(setq frame-resize-pixelwise t)


;; ==================== Package manager ====================
;; Source
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; Disable package signature verification
(setq package-check-signature nil)

;; Initialize
(require 'package)
(unless (bound-and-true-p package--initialized)
    (package-initialize))

;; Refresh package contents from the source
(unless package-archive-contents
    (package-refresh-contents))

;; require before use
(require 'use-package)

;; Install the package if it is not present on the system
(setq use-package-always-ensure t)

;; To allow installation of github packages
(use-package quelpa-use-package)


;; ==================== Theme ====================
(use-package dracula-theme
  :init (load-theme 'dracula t))  ; Set the theme


;; ==================== Enhance ====================
;; Key hint
(use-package which-key
  :hook (after-init . which-key-mode))

;; Completion
(use-package company
  :hook (after-init . global-company-mode))

;; Editing
(use-package crux
  :bind (("C-S-k" . crux-smart-kill-line)  ;; Delete current line
	 ("C-a" . crux-move-beginning-of-line)  ;; Move to the first non-whitespace character
	 ("C-S-d" . crux-duplicate-current-line-or-region)
	 ("C-x ," . crux-find-user-init-file)))  ;; Open the init file
(use-package hungry-delete  ;; Delete up to non-whitespace character
  :hook (after-init . global-hungry-delete-mode))  ;; Enable hungry-deltele as default
  ;; :bind (("C-c DEL" . hungry-delete-backward)  ;; Delete preceding
  ;; 	 ("C-c d"   . hungry-delete-forward))) ;; Delete following

;; Minibuffer
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ;; ivy-initial-inputs-alist nil  ;; Remove the initial input "^" for sounsel-M-x
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))))
(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c f" . counsel-recentf)
         ("C-c g" . counsel-git)))
(use-package swiper
  :after (ivy)
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

;; Window switching
(use-package ace-window
  :bind ("M-o" . 'ace-window))

;; Line and region moving
(use-package drag-stuff
  :bind (("M-n" . drag-stuff-down)
	 ("M-p" . drag-stuff-up)))


;; ==================== Org-mode ====================
;; Media note
(use-package org-media-note
  ;; :quelpa (org-media-note :fetcher github :repo "yuchen-lea/org-media-note")
  :hook (org-mode .  org-media-note-mode)
  :bind ("s-v" . org-media-note-hydra/body)  ;; Main entrance
  :config (setq org-media-note-screenshot-image-dir "~/Documents/Notes/imgs/"))

;; Replace stars with bullets for headline
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; Adaptive indentation according to the headline level
(setq org-adapt-indentation t)

;; Dynamic Headline Numbering
;; (setq org-num-mode t)

;; Hide emphasis markers
(setq org-hide-emphasis-markers t)

;; Expand emphasis markers automatically
(use-package org-appear
  :hook (org-mode . org-appear-mode))

;; Scale up the latex formula
(with-eval-after-load 'org  ;; Set it before org mode will result in a warning
  (setq org-format-latex-options
	(plist-put org-format-latex-options :scale 4.3)))

;; Preview latex automatically
(use-package org-fragtog
  :hook (org-mode . org-fragtog-mode))


;; ==================== Beancount-mode ====================
(use-package beancount
  ;; :quelpa (beancount :fetcher github :repo "beancount/beancount-mode")
  :config (add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode)))


;; ==================== Misc. ====================
;; Stop generating the custom-set-variables
(setq custom-file "/dev/null")

;; Remove the key bindings of suspend-frame
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))


;; ==================== Journal ====================
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("j" "Journal"  ;; Prompt
	entry (file+datetree "~/Documents/Notes/Journal.org")
        "* %^{heading} %U\n  %?")))  ;; Template
