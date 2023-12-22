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

;; ==================== Packages ====================
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




;; ==================== Media note ====================
(use-package quelpa-use-package)  ;; to allow installation of github packages
(use-package pretty-hydra)
(use-package org-media-note
  :quelpa (org-media-note :fetcher github :repo "yuchen-lea/org-media-note")
  :hook (org-mode .  org-media-note-mode)
  :bind (("s-v" . org-media-note-hydra/body))  ;; Main entrance
  :config
  (setq org-media-note-screenshot-image-dir "~/Documents/Notes/imgs/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" default))
 '(package-selected-packages '(quelpa-use-package major-mode-hydra mpv dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

