(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  ;; This MIGHT be a bad idea, check .zshenv in case of errors
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))

(use-package use-package-core
  :custom
  (use-package-enable-imenu-support t))

(use-package elfeed
  :bind ("C-c e" . elfeed)
  :custom
  (elfeed-use-curl t)
  (elfeed-curl-max-connections 20)
  (elfeed-search-title-max-width 80)
  (elfeed-feeds
   '(("http://planet.emacslife.com/atom.xml" blog emacs dense)
     "https://babbagefiles.xyz/posts/atom.xml"
     ("http://www.shakthimaan.com/news.xml" emacs)
     ("https://blog.steve.fi/index.rss" blog debian)
     ("http://technomancy.us/feed/atom.xml" blog emacs)
     ("http://dreamcafe.com/feed/" author musician blog)
     ("https://lispblog.xach.com/rss" blog lisp)
     ("https://xkcd.com/atom.xml" comics)
     ("http://kushaldas.in/rss.xml" emacs blog tech)
     ("https://blog.liw.fi/index.atom" emacs blog tech)
     ("http://feeds.feedburner.com/StudyHacks" blog productivity)
     ("https://blog.vero.site/index.xml" blog puzzles)
     ("http://bach.ai/feed.xml" science blog)
     ("http://norvig.com/rss-feed.xml" author tech science)
     ("http://karpathy.github.io/feed.xml" blog ai science)
     ("http://esr.ibiblio.org/?feed=rss2" blog tech author)
     ("https://binaryredneck.net/index.xml" uncertain)
     ("http://www.earth.li/~noodles/blog/feed.xml" uncertain)
     ("http://blog.stephenwolfram.com/feed/" blog science author)
     ("http://jordi.inversethought.com/feed/" blog emacs math)
     ("https://usesthis.com/feed.atom")
     ("http://idevji.com/feed" blog tech)
     ("https://gitlab.com/protesilaos/modus-themes/-/tags?feed_token=WVu_3EwWidkDhPDG-LJy&format=atom" upstream-tags modus-themes debian-contrib)
     ("http://www.aaronsw.com/2002/feeds/pgessays.rss" uncertain)
     ("http://www.antipope.org/charlie/blog-static/atom.xml" author blog scifi)
     "https://yihui.org/en/index.xml"
     "https://supersciencegrl.co.uk/rss.xml"
     ("https://www.solipsys.co.uk/rss.xml" math blog)
     ("https://www.murilopereira.com/index.xml" blog emacs)
     ("https://www.scottaaronson.blog?feed=rss2" uncertain)
     ("https://www.hamvocke.com/feed.xml" blog uncertain)
     ("https://world.hey.com/dhh/feed.atom" blog)
     ("https://medium.com/feed/@@nic__carter" blog cryptocurrencies)
     ("https://sathyabh.at/index.xml" blog tech)
     ("https://sathyasays.com/index.xml" blog tech)
     ("http://philhart.com/rss.xml" astronomy science)
     ("https://apod.nasa.gov/apod.rss" astronomy science)
     ("https://www.peterzelinka.com/blog.rss"  astronomy science)
     ("https://nileshgr.com/feed/" blog uncertain)
     ("https://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-teaser.xml" blog emacs uncertain)
     ("https://protesilaos.com/news.xml" blog)
     ("https://protesilaos.com/books.xml" blog philosophy)
     ("https://protesilaos.com/politics.xml" blog politics)
     ("http://tofspot.blogspot.com/feeds/posts/default" blog author scifi)
     ("http://blog.samaltman.com/posts.atom" blog)
     ("https://vitalik.ca/feed.xml" cryptocurrencies blog)
     ("https://news.ycombinator.com/rss" news tech dense hackernews)
     ("https://johnmarkmorris.com/feed/" uncertain)
     ("https://hamblingreen.gitlab.io/rss.xml" blog tech)
     ("https://danluu.com/atom.xml" blog tech)
     ("https://gretzuni.com/atom" emacs philosophy uncertain)
     ("https://abaaonline.blogspot.com/atom.xml" blog astronomy science)
     ("https://geohot.github.io/blog/feed.xml" blog tech science)
     ("https://www.overcomingbias.com/feed" blog rationality science)
     ("https://aswathdamodaran.blogspot.com/feeds/posts/default" blog finance)
     ("https://keepthinking.blog/index.xml" blog emacs)
     ("https://lockywolf.net/atom-full.xml" blog emacs)
     ("https://idiomdrottning.org/blog" blog emacs))))

(use-package dired
  :hook (dired-mode . denote-dired-mode))

(use-package dired-aux
  :defer t
  :custom
  (dired-isearch-filenames 'dwim)
  (dired-create-destination-dirs 'ask)
  (dired-vc-rename-file t))

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  :hook (ibuffer-mode . hl-line-mode)
  :custom
  (ibuffer-use-other-window nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-movement-cycle nil)
  (ibuffer-use-header-line t)
  (ibuffer-default-sorting-mode 'filename/process))

(use-package window
  :bind (("s-n" . next-buffer)
         ("s-p" . previous-buffer)
         ("s-o" . other-window)
         ("s-2" . split-window-below)
         ("s-3" . split-window-right)
         ("s-0" . delete-window)
         ("s-1" . delete-other-windows)
         ("s-5" . delete-frame)
         ("C-x _" . balance-windows)
         ("C-x +" . balance-windows-area)
         ("s-q" . window-toggle-side-windows)
	 ("s-u" . revert-buffer)))

(use-package battery
  :hook (after-init . display-battery-mode)
  :config
  (setq battery-mode-line-format " [%b%p%%]")
  (setq battery-mode-line-limit 95)
  (setq battery-update-interval 180)
  (setq battery-load-low 20)
  (setq battery-load-critical 10))

(use-package time
  :unless (memq window-system '(mac ns))
  :hook (after-init . display-time-mode)
  :config
  (setq display-time-format "%H:%M  %Y-%m-%d")
  (setq display-time-interval 60)
  (setq display-time-mail-directory nil)
  (setq display-time-default-load-average nil))

(use-package emacs
  :hook (after-init . window-divider-mode)
  :bind (("s-k" . kill-buffer))
  :config
  (setq window-divider-default-right-width 1)
  (setq window-divider-default-bottom-width 1)
  (setq window-divider-default-places 'right-only)
  (setq gc-cons-threshold 100000000)  ;; for lsp-mode
  (setq read-process-output-max (* 1024 1024))   ;; 1mb for lsp-mode)
  (require-theme 'modus-themes) ; `require-theme' is ONLY for the built-in Modus themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil)
  (setq modus-themes-to-toggle '(modus-operandi modus-vivendi))
  (setq modus-themes-completions
      '((matches . (bold))
        (selection . (bold italic))))
  (setq modus-themes-fringes 'subtle)
  (setq modus-themes-links '(neutral-underline))
  (setq modus-themes-prompts '(intense))
  (setq modus-themes-region '(bg-only accented))
  (setq sentence-end-double-space nil)
  ;; TODO Check modus-themes-org-agenda

  (load-theme 'modus-operandi)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

(use-package fringe
  :config
  (fringe-mode nil)
  :custom
  (setq-default fringes-outside-margins nil)
  (setq-default indicate-buffer-boundaries 'left)
  (setq-default indicate-empty-lines nil)
  (setq-default overflow-newline-into-fringe t))

(use-package electric
  :config
  (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
  (setq electric-pair-preserve-balance t)
  (setq electric-quote-context-sensitive t)
  (setq electric-quote-paragraph t)
  (setq electric-quote-string nil)
  (setq electric-quote-replace-double t)
  (defun cq/electric-pair-mode-hook ()
    (electric-indent-mode 1)
    (electric-pair-mode 1)
    (electric-quote-mode 1))
  :hook (after-init . cq/electric-pair-mode-hook))

(use-package org
  :bind (("C-c c" . org-capture)
	 ("C-c a" . org-agenda))
  :hook ((org-mode . auto-fill-mode)
	 (org-agenda-mode . hl-line-mode)
	 (org-store-link-functions . cq/org-elfeed-entry-store-link))
  :config
  (require 'org-protocol)
  (setq org-directory (directory-file-name "~/Documents/org"))
  (setq org-agenda-files (list (file-name-concat org-directory "productivity" "todo.org")))
  (setq org-archive-location (string-join
			      (list (file-name-concat org-directory "productivity" "archive.org")
				    "::* From %s")))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline
			     (lambda () (file-name-concat org-directory "productivity" "todo.org"))
			     "Inbox")
           "* TODO %? %^G\n %i\n %a %u")
	  ("c" "Todo" entry (file+headline
			     (lambda () (file-name-concat org-directory "productivity" "todo.org"))
			     "Inbox")
           "* TODO %?%a\n %u")
	  ("l" "Elfeed reading list" entry (file+headline
					    (lambda () (file-name-concat
						   (denote-directory)
						   "20230206T124634--reading-list__lists_productivity.org"))
					    "Reading list")
            "* TODO %a\n %t")))
  (defun cq/org-elfeed-entry-store-link ()
    (when elfeed-show-entry
      (let* ((link (elfeed-entry-link elfeed-show-entry))
             (title (elfeed-entry-title elfeed-show-entry)))
	(org-link-store-props
	 :link link
	 :description title))))
  (setq org-use-speed-commands t))

(define-key key-translation-map (kbd "C-x 8 $") (kbd "₹"))

(use-package frame
  :config
  (blink-cursor-mode -1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 5))

(use-package vertico-reverse
  :after vertico
  :init
  (vertico-reverse-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(setq major-mode-remap-alist
 '((yaml-mode . yaml-ts-mode)
   (bash-mode . bash-ts-mode)
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (python-mode . python-ts-mode)))

(use-package python
  :defer t
  :custom
  (python-shell-interpreter "python3"))

(use-package graphql-ts-mode
  :mode ("\\.graphql\\'" "\\.gql\\'"))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "s-l")
  :commands (lsp lsp-deferred)
  :hook ((python-ts-mode . lsp)
	 (typescript-ts-mode . lsp))
  :config
  (setq lsp-idle-delay 0.500)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-pyright)

;; dap-mode setup
;; posframe
;; lsp-docker
;; -> yaml
;; bui
;; lsp-treemacs
;; -> treemacs
;; --> pfuture
(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :hook (dap-stopped . (lambda (arg)
			 (call-interactively #'dap-hydra)))
  :custom
  (dap-python-debugger 'debugpy)
  (dap-python-terminal "vterm")
  (dap-auto-show-output nil)
  :config
  ;; Enabling only some features
  (setq dap-auto-configure-features '(sessions locals breakpoints expressions))
  ;; (dap-auto-configure-mode)
  (require 'dap-node)
  (require 'dap-python)
  ;; no support for direnv, the function uses pyenv’s modules if pyenv
  ;; is found in path
  (defun dap-python--pyenv-executable-find (command)
    (executable-find "python")))

;; (use-package ledger-mode
;;   :config
;;   (setq ledger-binary-path "/usr/local/bin/hledger")
;;   (setq ledger-mode-should-check-version nil)
;;   (setq ledger-report-native-highlighting-arguments '("--color=always")))

(use-package envrc
  :diminish
  :init (envrc-global-mode))

(use-package lin
  :init (lin-global-mode t)
  :config
  (setq lin-mode-hooks
        '(dired-mode-hook
          elfeed-search-mode-hook
          git-rebase-mode-hook
          grep-mode-hook
          ibuffer-mode-hook
          magit-log-mode-hook
          occur-mode-hook
          org-agenda-mode-hook
	  rg-mode-hook))
  (lin-global-mode t))

(use-package denote
  :hook (find-file . denote-link-buttonize-buffer)
  :bind (
	 ("C-c n j" . denote-journal-extras-new-or-existing-entry)
	 ("C-c n n" . denote)
	 ("C-c n D" . cq/open-denote-directory)
	 ("C-c n N" . denote-type)
	 ("C-c n i" . denote-link)
	 ("C-c n I" . denote-add-links)
	 ("C-c n b" . denote-backlinks)
	 ("C-c n f b" . denote-find-backlink)
	 ("C-c n r" . denote-rename-file)
	 ("C-c n R" . denote-rename-file-using-front-matter)
	 ("C-c n ." . cq/insert-time-stamp))
  :custom
  (denote-directory "~/Documents/notes")
  (denote-infer-keywords t)
  (denote-sort-keywords t)
  (denote-file-type 'text)
  (denote-prompts '(title keywords))
  (denote-journal-extras-title-format 'day-date-month-year)
  :config
  (setq crm-separator ",")
  (defun cq/open-denote-directory ()
    (interactive)
    (revert-buffer (dired denote-directory)))
  (defun cq/insert-time-stamp ()
    "Insert a timestamp with a newline character."
    (interactive)
    (insert (current-time-string))
    (newline)))

(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap ("C-x p" . projectile-command-map)
  :diminish
  :custom
  (setq projectile-project-search-path '("~/workspace/" "~/.emacs.d/"))
  (setq projectile-indexing-method 'alien))

(defun cq/search-word ()
  (interactive)
  (let ((word (if (use-region-p)
                  (buffer-substring-no-properties (region-beginning) (region-end))
                (read-string "Word lookup: "))))
    (if (eq system-type 'darwin)
        (shell-command (format "open dict://%s" (shell-quote-argument word)))
      (eww (concat "https://en.wiktionary.org/wiki/" word) 4))))

(use-package reveal
  :diminish)

(use-package outline
  :diminish outline-minor-mode)

(use-package eldoc
  :diminish)

(use-package abbrev
  :diminish abbrev-mode)

(use-package autorevert
  :diminish auto-revert-mode)

(use-package olivetti
  :diminish (olivetti-mode " ✍️"))

(use-package face-remap
  :diminish (buffer-face-mode text-scale-mode))

(use-package simple
  :diminish visual-line-mode)

(use-package tex-site                   ; auctex
  :load-path "lib/auctex/"
  :defines (latex-help-cmd-alist latex-help-file)
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :init
  (setq reftex-plug-into-AUCTeX t)
  (setenv "PATH" (concat "/Library/TeX/texbin:"
                         (getenv "PATH")))
  (add-to-list 'exec-path "/Library/TeX/texbin")
  :config
  (defun latex-help-get-cmd-alist ()    ;corrected version:
    "Scoop up the commands in the index of the latex info manual.
   The values are saved in `latex-help-cmd-alist' for speed."
    ;; mm, does it contain any cached entries
    (if (not (assoc "\\begin" latex-help-cmd-alist))
        (save-window-excursion
          (setq latex-help-cmd-alist nil)
          (Info-goto-node (concat latex-help-file "Command Index"))
          (goto-char (point-max))
          (while (re-search-backward "^\\* \\(.+\\): *\\(.+\\)\\." nil t)
            (let ((key (buffer-substring (match-beginning 1) (match-end 1)))
                  (value (buffer-substring (match-beginning 2)
                                           (match-end 2))))
              (add-to-list 'latex-help-cmd-alist (cons key value))))))
    latex-help-cmd-alist)

  ;; (use-package ebib
  ;;   :load-path "site-lisp/ebib"
  ;;   :preface
  ;;   (use-package parsebib :load-path "site-lisp/parsebib"))
  (use-package latex
    :defer t
    :config
    (use-package preview)
    (add-hook 'LaTeX-mode-hook 'reftex-mode)))

(use-package typescript-ts-mode
  :custom
  (setq typescript-ts-mode-indent-offset 2))

;; Taken from Mickey’s config!
(use-package treesit
  :preface
  (defun mp-setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	       (cmake "https://github.com/uyha/tree-sitter-cmake")
	       (css "https://github.com/tree-sitter/tree-sitter-css")
	       (elisp "https://github.com/Wilfred/tree-sitter-elisp")
	       ;; (go "https://github.com/tree-sitter/tree-sitter-go")
	       (html "https://github.com/tree-sitter/tree-sitter-html")
	       (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	       (json "https://github.com/tree-sitter/tree-sitter-json")
	       (make "https://github.com/alemuller/tree-sitter-make")
	       (markdown "https://github.com/ikatyang/tree-sitter-markdown")
	       (python "https://github.com/tree-sitter/tree-sitter-python")
	       ;; (toml "https://github.com/tree-sitter/tree-sitter-toml")
	       (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	       (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	       (yaml "https://github.com/ikatyang/tree-sitter-yaml")
	       (graphql "https://github.com/bkegley/tree-sitter-graphql")))
      (add-to-list 'treesit-language-source-alist grammar)
      ;; Only install `grammar' if we don't already have it
      ;; installed. However, if you want to *update* a grammar then
      ;; this obviously prevents that from happening.
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))

  ;; Optional, but recommended. Tree-sitter enabled major modes are
  ;; distinct from their ordinary counterparts.
  ;;
  ;; You can remap major modes with `major-mode-remap-alist'. Note
  ;; that this does *not* extend to hooks! Make sure you migrate them
  ;; also
  (dolist (mapping '((python-mode . python-ts-mode)
                     (css-mode . css-ts-mode)
                     (typescript-mode . tsx-ts-mode)
                     (json-mode . json-ts-mode)
                     (js-mode . js-ts-mode)
                     (css-mode . css-ts-mode)
                     (yaml-mode . yaml-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))

  :config
  (mp-setup-install-grammars)
  ;; Do not forget to customize Combobulate to your liking:
  ;;
  ;;  M-x customize-group RET combobulate RET
  ;;
  (use-package combobulate
    :preface
    ;; You can customize Combobulate's key prefix here.
    ;; Note that you may have to restart Emacs for this to take effect!
    (setq combobulate-key-prefix "C-c o")

    ;; Optional, but recommended.
    ;;
    ;; You can manually enable Combobulate with `M-x
    ;; combobulate-mode'.
    :hook ((python-ts-mode . combobulate-mode)
           (js-ts-mode . combobulate-mode)
           (css-ts-mode . combobulate-mode)
           (yaml-ts-mode . combobulate-mode)
           (json-ts-mode . combobulate-mode)
           (typescript-ts-mode . combobulate-mode)
           (tsx-ts-mode . combobulate-mode))))

(use-package rg
  :init (rg-enable-default-bindings))

(use-package indent-guide
  :diminish
  :custom-face
  (indent-guide-face ((t (:foreground "#535353" :slant normal))))
  :custom
  (indent-guide-char "│")
  (indent-guide-threshold 5))

(use-package ispell
  :defer t
  :custom
  ;; Change the ordering of dicts used in echant’s config
  (ispell-program-name "enchant-2"))

(use-package flyspell
  :diminish)

(use-package prog-mode
  :hook ((prog-mode . (lambda () (hl-line-mode 1)))
	 (prog-mode . indent-guide-mode)
	 (prog-mode . flyspell-prog-mode)))

(use-package text-mode
  :hook ((text-mode . flyspell-mode)))
;; magit-delta deps
;; - xterm-color
(use-package magit-delta
  :hook (magit-mode . magit-delta-mode))
