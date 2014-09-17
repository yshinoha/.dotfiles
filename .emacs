;; 日本語IM用の設定
(setq default-input-method "MacOSX")

;; '¥' を入力したら '\' となるように
(define-key global-map [?¥] [?\\])

(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; package
(require 'package)
(add-to-list 'package-archives
        '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
;;auto-installの設定
(when(require 'auto-install nil t)
  ;;インストールディレクトリを設定する
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;;EmacsWikiに登録されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;;install-elispの関数を利用可能にする
  (auto-install-compatibility-setup)
)

; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
;(global-auto-complete-mode t)
(global-auto-complete-mode 1)
(setq ac-auto-start t)

;pawoer line
(require 'powerline)
(powerline-default-theme)
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#FF0066"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fff"
                    :background "#FF6699"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#000"
                    :background "#ffaeb9"
                    :inherit 'mode-line)

; color
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq molokai-theme-kit t)
(load-theme 'molokai t)


;----------------------------------
; rails
;----------------------------------
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
  (add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)


;----------------------------------
; other
;----------------------------------
;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名表示
;(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; タイトルバーにファイル名表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; 何文字目にいるか表示
(column-number-mode 1)

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "gray24"
                  :underline nil))
    (t ()))
  "*Face used by hl-line.")
;;(setq hl-line-face 'underline)
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha 100) ; 透明度
      (tool-bar-mode nil)                  ; ツールバー非表示
      (set-scroll-bar-mode nil)            ; スクロールバー非表示
      (setq line-spacing 0.2)              ; 行間
      (when (>= emacs-major-version 23)
        (tool-bar-mode nil)
        (set-frame-font "Menlo-12")
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "M+2VM+IPAG circle" :size 14)))
      (setq ns-pop-up-frames nil)))

;;C-hがBackspaceになる
;(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)


; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)


;;(require 'evil)
;;(evil-mode 1)
