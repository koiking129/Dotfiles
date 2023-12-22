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



;; ==================== Org-mode ====================
;; Media note
(use-package mpv)
(use-package major-mode-hydra)
(use-package quelpa-use-package)  ;; to allow installation of github packages
(use-package pretty-hydra)
(use-package org-media-note
  ;; :quelpa (org-media-note :fetcher github :repo "yuchen-lea/org-media-note")
  :hook (org-mode .  org-media-note-mode)
  :bind ("s-v" . org-media-note-hydra/body)  ;; Main entrance
  :config (setq org-media-note-screenshot-image-dir "~/Documents/Notes/imgs/"))


