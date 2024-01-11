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

;; Inhibit startup screen
(setq inhibit-startup-screen t)


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
  :bind (("C-k" . crux-smart-kill-line)  ;; Delete current line
	 ("C-a" . crux-move-beginning-of-line)  ;; Move to the first non-whitespace character
	 ("C-S-d" . crux-duplicate-current-line-or-region)
	 ("C-x ," . crux-find-user-init-file)))  ;; Open the init file
(use-package hungry-delete  ;; Delete up to non-whitespace character
  :bind (("C-c DEL" . hungry-delete-backward)  ;; Delete preceding
         ("C-c d"   . hungry-delete-forward))) ;; Delete following

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
         ("C-c a" . counsel-rg)
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
  :bind ("C-c v" . org-media-note-hydra/body)  ;; Main entrance
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
;; Hide the white spaces when emphasizing Hanzi
(font-lock-add-keywords 'org-mode
                        '(("\\cc\\( \\)[/+*_=~][^a-zA-Z0-9/+*_=~\n]+?[/+*_=~]\\( \\)?\\cc?"
                           (1 (prog1 ()
				(compose-region (match-beginning 1) (match-end 1) ""))))
                          ("\\cc?\\( \\)?[/+*_=~][^a-zA-Z0-9/+*_=~\n]+?[/+*_=~]\\( \\)\\cc"
                           (2 (prog1 ()
				(compose-region (match-beginning 2) (match-end 2) "")))))
                        'append)

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

;; Default working directory
(setq default-directory (concat (getenv "HOME") "/Documents/Notes"))

;; Use space instead of tab for indentation
(setq-default indent-tabs-mode nil)


;; ==================== Journal ====================
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("j" "Journal"  ;; Prompt
	entry (file+datetree "~/Documents/Notes/Journal.org")
        "* %^{heading} %U\n  %?")))  ;; Template


;; ==================== Writing ====================
(use-package writeroom-mode
  :bind ("C-c z" . writeroom-mode))


;; ==================== Tabs ====================
(use-package awesome-tab
  ;; :quelpa (awesome-tab :fetcher github :repo "manateelazycat/awesome-tab")
  :hook (after-init . awesome-tab-mode))


;; ==================== File explorer ====================
(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           25
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))
