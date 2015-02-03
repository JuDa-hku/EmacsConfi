(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(make-backup-files nil)
 '(markdown-command "~/.cabal/bin/pandoc -f markdown -t html -s --mathjax --highlight-style espresso"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 151 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

(setq python-remove-cwd-from-path nil)

(load-file "~/.emacs.d/emacs-for-python/epy-init.el")


: (load-file "~/.emacs.d/mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'load-path "~/.emacs.d/modes")


;;I use auctex in emacs for pdf and evince for preview.
(setq TeX-PDF-mode t)
(defun pdfevince ()
   (add-to-list 'TeX-output-view-style
                 '("^pdf$" "." "evince %o %(outpage)")))
(add-hook  'LaTeX-mode-hook  'pdfevince  t) ; AUCTeX LaTeX mode



(setq ispell-program-name "aspell")
(setq-default major-mode 'text-mode)
(ispell-change-dictionary "american" t)  
(add-hook 'text-mode-hook 'flyspell-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t)
(autoload 'tex-mode-flyspell-verify "flyspell" "" t) 

;;to fold function in prog
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


(add-hook 'python-mode-hook 'jedi:setup)



(set-background-color "#CCFFCC")
