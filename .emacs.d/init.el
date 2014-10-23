(require 'cask)
(cask-initialize)

(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;パッケージリスト
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
 (push '("marmalade" . "http://marmalade-repo.org/packages/")
         package-archives )

(when (not package-archive-contents)
  (package-refresh-contents))

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/") ;Emacs Lispをインストールするディレクトリの指定
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) ;install-elisp.elとコマンド名を同期

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; php-mode
(require 'php-mode)
 
(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(load-theme 'solarized-dark t)
(load-theme 'tango-dark t)
(setq molokai-theme-kit t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;---------------------------------------
;----------------others-----------------
;---------------------------------------

;; M-x wでコピー
(setq x-select-enable-clipboard t)

;; Ctrl-x p で逆向きへのウィンドウ移動
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

;; タブ幅をスペース2個幅に変更
(setq default-tab-width 2)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名表示
;(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;;
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

;;C-hがBackspaceになる
 (global-set-key "\C-h" 'delete-backward-char)

 ;; 'o' 次の行に挿入
 (defun edit-next-line ()
   (interactive)
     (end-of-line)
       (newline-and-indent))


;; 'O' 前の行に挿入
(defun edit-previous-line ()
  (interactive)
    (forward-line -1)
      (if (not (= (current-line) 1))
            (end-of-line))
              (newline-and-indent))

              (global-set-key (kbd "M-o") 'edit-next-line)
              (global-set-key (kbd "M-O") 'edit-previous-line)

;;(require 'evil)
;;(evil-mode 1)

;; window移動をやじるしで
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

 ;; 動的略語展開のキー
  (global-set-key (kbd "C-<tab>") 'dabbrev-expand)
   (define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

   (defun my-next-line-n () (interactive) (next-line 10))
   (defun my-prev-line-n () (interactive) (previous-line 10))
   (global-set-key (kbd "C-<") 'my-next-line-n)
   (global-set-key (kbd "C->") 'my-prev-line-n)

;;; flymake settings
;;; Flymake
(require 'flymake)
 
;; M-p/M-n で警告/エラー行の移動
(global-set-key "\M-p" 'flymake-goto-prev-error)
(global-set-key "\M-n" 'flymake-goto-next-error)
 
;; エラー表示(お好みで)
(global-set-key "\C-ce" 'flymake-my-display-err-minibuf-for-current-line)
;;(global-set-key "\C-ce" 'flymake-my-display-err-popup-for-current-line)
 
;; Minibuf に出力
(defun flymake-my-display-err-minibuf-for-current-line ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no            (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count              (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((text       (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))
 
;; popup.el を使って tip として表示
(when (require 'popup nil t)
  (defun flymake-my-display-err-popup-for-current-line ()
    "Display a menu with errors/warnings for current line if it has errors and/or warnings."
    (interactive)
    (let* ((line-no            (flymake-current-line-no))
           (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (menu-data          (flymake-make-err-menu-data line-no line-err-info-list)))
      (if menu-data
          (popup-tip (mapconcat '(lambda (e) (nth 0 e))
                                (nth 1 menu-data)
                                "\n")))
      )))
 
;; 保存先をtemporary-file-directoryに変更したもの
(defun flymake-create-temp-intemp (file-name prefix)
  "Return file name in temporary directory for checking FILE-NAME.
This is a replacement for `flymake-create-temp-inplace'. The
difference is that it gives a file name in
`temporary-file-directory' instead of the same directory as
FILE-NAME.
 
For the use of PREFIX see that function.
 
Note that not making the temporary file in another directory
\(like here) will not if the file you are checking depends on
relative paths to other files \(for the type of checks flymake
makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    temp-name))
 
;; use Makefile with temporary-file-direcotry
(defun flymake-simple-make-init-intemp ()
  (flymake-simple-make-init-impl 'flymake-create-temp-intemp nil t "Makefile" 'flymake-get-make-cmdline))
 
(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-intemp))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))
 
;;; flymake related with major-mode
(defvar flymake-allowed-major-mode nil)
(defadvice flymake-get-file-name-mode-and-masks (after after-test activate)
  (unless ad-return-value
    (setq ad-return-value
          (let ((mm flymake-allowed-major-mode)
                (mode-and-masks  nil))
            (while (and (not mode-and-masks) mm)
              (if (string= (car (car mm)) (symbol-name major-mode))
                  (setq mode-and-masks (cdr (car mm))))
              (setq mm (cdr mm)))
            mode-and-masks))))
 
;; unset file-name-masks because major-mode is used for flymake
(setq flymake-allowed-file-name-masks nil)
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-intemp))
         (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "/home/y/bin/php" (list "-f" local "-l"))))
 
(add-to-list 'flymake-err-line-patterns
             '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))
 
;; add major-mode to flymake
(push '("php-mode" flymake-php-init) flymake-allowed-major-mode)
(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;保管時に強制的に大文字になる現象を呈し
;(custom-set-valiables '(ac-ignore-case nil))
;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
