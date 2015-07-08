;;-----------------------------------------------------------------------------
;;font
;;----------------------------------------------------------------------------
(set-default-font "-apple-Monaco-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")

;;------------------------------------------------------------------------------
;;显示时间
;;------------------------------------------------------------------------------
(display-time)

;;------------------------------------------------------------------------------
;;不生成临时文件
;;------------------------------------------------------------------------------
(setq-default make-backup-files nil)

;;------------------------------------------------------------------------------
;;mpg123
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/mpg123/")
(setq lrc-lyric-dir "~/Music/lrc/") 
(require 'mpg123)

;; weblogger

;;------------------------------------------------------------------------------
;; metaweblog
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/metaweblog/")

;;------------------------------------------------------------------------------
;; org2blog
;; depencies 
;;   1.xml-rpc
;;   2.metaweblog
;;------------------------------------------------------------------------------

;; add load path
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/org2blog/")
(require 'org2blog-autoloads)
(setq org2blog/wp-blog-alist
      `(("le5u"
         :url "http://localhost/wordpress/xmlrpc.php"
         :username "le5u"
         :password "le5pan"
         :keep-new-lines t
         :confirm t
         :wp-code nil
         :tags-as-categories nil)
        ))

(setq org2blog/wp-buffer-template
      "#+DATE: %s
#+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil TeX:nil
#+CATEGORY: emacs
#+TAGS:
#+PERMALINK:
#+TITLE:
\n")

;;-------------------------------------------------------------------------------
;; emms
;;-------------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/emms")
(require 'init-emms)

;;-------------------------------------------------------------------------------
;; mew收发邮件配置
;;-------------------------------------------------------------------------------
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(setq mew-use-cached-passwd t)
(setq mew-pop-delete nil)
;; Optional setup (Read Mail menu for Emacs 21):
(if (boundp 'read-mail-command)
    (setq read-mail-command 'mew))
;; Optional setup (e.g. C-xm for sending a message):
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-send-message
      'mew-draft-kill
      'mew-send-hook))
(when (boundp 'utf-translate-cjk)
  (setq utf-translate-cjk t)
  (custom-set-variables
   '(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
    (utf-translate-cjk-mode 1))
;;用w3m来读html格式邮件
(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))
(condition-case nil
    (require 'mew-w3m)
  (file-error nil))
(setq mew-use-text/html t)
;;mail account config
(setq mew-config-alist
      '(
        ("default"
         (pop-server "pop.163.com")
         (name "163")
         (user "i9erle")
         (mail-domain "163.com")
         (pop-auth pass)
         (pop-user "i9erle@163.com")
         (smtp-user "i9erle@163.com")
         (smtp-server "smtp.163.com")
         )
        )
      )
;;设置邮件签名档
(setq mew-signature-file "~/Mail/signature")
(setq mew-signature-as-lastpart t)
(setq mew-signature-insert-last t)
(add-hook 'mew-before-cite-hook 'mew-header-goto-body)
(add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)
;;设置邮件分类
(setq mew-refile-guess-alist
      '(("To:"
         ("@163.com" . "+Mail/163"))
        ("Cc:"
         ("@163.com" . "+Mail/163"))
        (nil . "+inbox")))
(setq mew-refile-guess-control
      '(mew-refile-guess-by-alist))
;;设置邮件显示栏目
(setq mew-summary-form
      '(type (10 date) " " (40 from) " " t (0 subj)))
(setq mew-summary-form-extract-rule '(name))

;;----------------------------------------------------------------------------
;;sr-speedbar
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/")
(require 'sr-speedbar)

;;----------------------------------------------------------------------------
;;linum
;;----------------------------------------------------------------------------
(global-linum-mode t)

(setq linum-format "%4d\u2502")

(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd " w) line) 'face 'linum)))
                                        ;(setq linum-format 'linum-format-func)



;;-----------------------------------------------------------------------------
;;cedet
;;----------------------------------------------------------------------------
(require 'cedet)

;;-----------------------------------------------------------------------------
;;ede
;;-----------------------------------------------------------------------------
(global-ede-mode t)

;;------------------------------------------------------------------------------
;;ecb
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/ecb/")
(require 'ecb)
(require 'ecb-autoloads)
;; ;;;;窗口间切换
(global-set-key [M-left]  'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up]    'windmove-up)
(global-set-key [M-down]  'windmove-down)

 ;;;;show&hide window 
(global-set-key [C-f1] 'ecb-hide-ecb-windows)
(global-set-key [C-f2] 'ecb-show-ecb-windows)


;; ;;;; 使某一ecb窗口最大化
(global-set-key (kbd "C-c 1") 'ecb-maximize-window-directories)
(global-set-key (kbd "C-c 2") 'ecb-maximize-window-sources)
(global-set-key (kbd "C-c 3") 'ecb-maximize-window-methods)
(global-set-key (kbd "C-c 4") 'ecb-maximize-window-history)

;; ;;;;恢复原始窗口布局
(global-set-key (kbd "C-c 0") 'ecb-restore-default-window-sizes)

(setq stack-trace-on-error t)
;;--------------------------------------------------------------------------

;;---------------------------------------------------------------------------
;;jdee el
;;---------------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/jdee/lisp")
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/elb/")
(require 'jde)
;;---------------------------------------------------------------------------
;;tabbar
;;---------------------------------------------------------------------------
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key (kbd "") 'tabbar-backward)
(global-set-key (kbd "") 'tabbar-forward)

;;---------------------------------------------------------------------------
;; screenshot in org-mode
;;---------------------------------------------------------------------------

(defun my-screenshot ()
  "Take a screenshot into a unique-named file in the current buffer file directory and insert a link to this file."
  (interactive)
  (setq filename
        (concat (make-temp-name
                 (concat (file-name-directory (buffer-file-name)) "images/" ) ) ".png"))
  (if (file-accessible-directory-p (concat (file-name-directory (buffer-file-name)) "images/"))
      nil
    (make-directory "images"))
  (call-process-shell-command "scrot" nil nil nil nil "-s" (concat
                                                            "\"" filename "\"" ))
  (insert (concat "[[" filename "]]"))
  (org-display-inline-images)
  )

(global-set-key (kbd "s-p") 'my-screenshot)
;;-----------------------------------------------------------------------------------

;;----------------------------------------------------------------------------------
;;w3m
;;----------------------------------------------------------------------------------

;;load & init 
;;(autoload 'w3m "w3m" "interface for w3m on emacs" t)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)

;;settings
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.baidu.com")
;(require 'mime-w3m)
(setq w3m-default-toggle-inline-images t)

;;--------------------------------------------------------------------------------------
;;clipboard 
;;--------------------------------------------------------------------------------------
(setq x-select-enable-clipboard t)

;;--------------------------------------------------------------------------------------
;;indent-hints
;;--------------------------------------------------------------------------------------
;;(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/")
;;(require 'indent-hints)
;;(indent-hints-global-mode)

;;--------------------------------------------------------------------------------------
;;indent-hint
;;--------------------------------------------------------------------------------------
(require 'indent-hint)

;;-------------------------------------------------------------------------------------
;;highlight-indentation
;;-------------------------------------------------------------------------------------

(require 'highlight-indentation)

;;-------------------------------------------------------------------------------------
;;insert current time
;;-------------------------------------------------------------------------------------
(defun insert-current-datetime ()
  "Insert the current date"
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d %H:%M:%S" (current-time)))
  )

;;--------------------------------------------------------------------------------------
;;live-down
;;--------------------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "~/git/dotfiles/emacs.d/site-lisp/emacs-livedown"))

(custom-set-variables
 '(livedown:autostart nil) ; automatically open preview when opening markdown files 
 '(livedown:open t)        ; automatically open the browser window
 '(livedown:port 1337))    ; port for livedown server

(require 'livedown)

;;---------------------------------------------------------
;;fanyi
;;---------------------------------------------------------
;;获取要翻译的词典

(defun get-current-word ()
  (interactive)
  (let ((begin (point-min)) (end (point-max)))
    (save-excursion
      (when (not mark-active)
        (backward-word)
        (mark-word))
      (setq begin (region-beginning)
            end (region-end)))
    (buffer-substring begin end)))

;;抓取翻译结果
(defun get-translate-result (word)
  (shell-command-to-string (concat (format "curl 'http://fanyi.youdao.com/openapi.do?keyfrom=bianle&key=1389341907&type=data&doctype=xml&version=1.1&q=%s' 2>/dev/null" word))))

;;分析翻译结果,并返回显示字符串
(defun analytic-translate-result (translateresult)
  (let* ((root (with-temp-buffer (insert translateresult)
                                 (xml-parse-region (point-min) (point-max))))
         (youdao-fanyi (car root))
         (basic (car (xml-get-children youdao-fanyi 'basic)))
         (explains-ex (xml-get-children (car (xml-get-children basic 'explains)) 'ex))
         (phonetic-texts (car (xml-node-children (car (xml-get-children basic 'phonetic)))))
         (explains-texts (concat "音标：" phonetic-texts "\n")))
    (loop for ex in explains-ex
          do (setq explains-texts (concat explains-texts  (car (xml-node-children ex)) "\n")))
    explains-texts))

;;主函数
(defun lookup-word ()
  (interactive)
  (let* ((word (get-current-word))
         (translate-result (get-translate-result word))
         (explains-texts (analytic-translate-result translate-result)))
    (tooltip-show explains-texts)))
;;绑定到Ctrl-c f组合键上
(global-set-key (kbd "C-c f") 'lookup-word)

;;-------------------------------------------------------------------
;;o-blog
;;-------------------------------------------------------------------
;;(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/o-blog/lisp/")
;;(require 'o-blog)

;;-------------------------------------------------------------------
;;el-get
;;--------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/el-get/")
(require 'el-get)

;;--------------------------------------------------------------------
;;2048-game
;;----------------------------------------------------------------------
(add-to-list 'load-path "~/git/dotfiles/emacs.d/site-lisp/game/")
(require '2048-game)

;;--------------------------------------------------------------------
;;hangman
(require 'hangman)
(setq hm-dictionary-file "/usr/share/dict/words")


;;-------------------------------------------------------------------
;;C-j 
;;-------------------------------------------------------------------

(dolist (hook '(lisp-interaction-mode-hook))
  (add-hook hook (lambda ()
                   (local-set-key (kbd "s-j") 'eval-print-last-sexp))))




(load-file "/home/bl/git/dotfiles/emacs.d/.macro")

(provide 'init-local)
