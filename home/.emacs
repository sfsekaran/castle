;; Add ~/.emacs.d/ to load path
(add-to-list 'load-path "~/.emacs.d/")

;; Load ELPA
(load "elpa/package")
(package-initialize)

;;;;
;; Adding functionality to Emacs

;;;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
;; Redefine some ido keys to my liking
(add-hook 'ido-setup-hook (lambda ()
  "Set up a custom keymap for `ido'."
  ;; Use up and down to choose a match (instead of left and right)
  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  ;; Use left and right for matching directories
  (define-key ido-completion-map (kbd "<right>") 'ido-next-match-dir)
  (define-key ido-completion-map (kbd "<left>")  'ido-prev-match-dir)))
(ido-mode t)
;; Enable fuzzy completion
(setq ido-enable-flex-matching t)
;; Hack ido to display items vertically instead of horizontally
;; http://www.emacswiki.org/emacs/InteractivelyDoThings#toc17
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(add-hook 'ido-minibuffer-setup-hook (lambda () (set (make-local-variable 'truncate-lines) nil)))

;; Load Rinari
;; (require 'rinari) ;; Do I need this anymore?

;; Load nXhtml
(load "nxhtml/autostart")
;; Rinari tweaks for nXhtml
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
;; indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)

;; Color theme
(require 'color-theme)
(color-theme-initialize)
(load "themes/color-theme-cobalt")
(add-hook 'after-init-hook 'color-theme-cobalt)

;; find-file-in-project
(load "find-file-in-project/find-file-in-project")
(define-key osx-key-mode-map (kbd "A-t") 'find-file-in-project)

;; textmate.el
(load "textmate.el/textmate")
(require 'textmate)
;; (textmate-mode) ;; Use textmate stuff piecemeal instead of including everything.
;; get Apple-/ working for commenting
(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line)
;; get Apple-t working with find-file-in-project or fuzzy-find-in-project (done, see find-file-in-project above)
;; get Apple-T working with goto-symbol (done)
(global-set-key (kbd "A-T") 'textmate-goto-symbol) ;; TODO: use etags or something with tab completion as well
;; get Apple-[ and Apple-] working for indentation.
(define-key osx-key-mode-map (kbd "A-]")  'textmate-shift-right)
(define-key osx-key-mode-map (kbd "A-[") 'textmate-shift-left)

;;;;
;; Modes

(defun disable-indent-mode ()
  (setq indent-tabs-mode nil))

;;;; RSpec-mode
(load "rspec-mode/rspec-mode")
(require 'rspec-mode)
;; Set some rspec-tmbundle esque default key bindings
(add-hook 'rspec-mode-hook '(lambda () (global-set-key (kbd "A-r") 'rspec-verify)))
(add-hook 'rspec-mode-hook '(lambda () (global-set-key (kbd "A-R") 'rspec-verify-single)))

;; cucumber.el
(load "cucumber.el/feature-mode")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; haml-mode
(load "haml-mode/haml-mode")
(require 'haml-mode)
(add-hook 'haml-mode-hook
          'disable-indent-mode)

;; js2-mode
(autoload 'js2-mode "js2-mode/js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml/")
(autoload 'rhtml-mode "rhtml/rhtml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\.erb$" . rhtml-mode))

;;;; Setup custom file modes
;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
;; scss files are css syntax
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; ECB (Emacs Code Browser)
;; (add-to-list 'load-path "~/.emacs.d/ecb/")
;; (require 'ecb)

;; revbufs
(load "revbufs/revbufs")
(require 'revbufs)

;; auto-indent-mode.el
;; (load "auto-indent-mode/auto-indent-mode")
;; (require 'auto-indent-mode)

;;;;
;; Text editing and indentation changes

;; Make sure we always autoindent
;; (add-hook 'ruby-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent))) ;; see auto-indent-mode.el
;; Line numbers on every buffer
(global-linum-mode 1)
;; Don't ever use tabs...
(setq-default indent-tabs-mode nil)
;; Set the tab-width to 2 spaces
(setq-default tab-width 2)
;; Set the "indent level" whatever that is
(setq-default c-indent-level 2)


;;;;
;; SLIME

(setq inferior-lisp-program "sbcl") ; your Lisp system
(require 'slime)
(slime-setup)
