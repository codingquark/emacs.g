(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package use-package-core
  :custom
  (use-package-enable-imenu-support t))

(load-theme 'modus-operandi)
(use-package modus-themes
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))

(use-package elfeed
  :hook ((elfeed-search-mode . lin-mode))
  :bind ("C-c e" . elfeed)
  :custom
  (elfeed-use-curl t)
  (elfeed-curl-max-connections 20)
  (elfeed-search-title-max-width 80)
  (elfeed-feeds
        '(("http://planet.emacslife.com/atom.xml" blog emacs planet)
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
          "https://craphound.com/feed"
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
	  ("https://www.blogger.com/feeds/35485673/posts/default" uncertain productivity)
	  ("http://blog.samaltman.com/posts.atom" blog)
	  ("https://vitalik.ca/feed.xml" cryptocurrencies blog)
	  ("https://news.ycombinator.com/rss" news tech hackernews)
	  ("https://johnmarkmorris.com/feed/" uncertain)
	  ("https://hamblingreen.gitlab.io/rss.xml" blog tech)
	  ("https://danluu.com/atom.xml" blog tech)
	  ("https://gretzuni.com/atom" emacs philosophy uncertain)
	  ("https://abaaonline.blogspot.com/atom.xml" blog astronomy science)
	  ("https://geohot.github.io/blog/feed.xml" blog tech science)
	  ("https://www.overcomingbias.com/feed" blog rationality science)
	  ("https://aswathdamodaran.blogspot.com/feeds/posts/default" blog finance))))

(use-package dired
  :hook (dired-mode . denote-dired-mode))

(use-package dired-aux
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
  (setq read-process-output-max (* 1024 1024))) ;; 1mb for lsp-mode)

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
	 (org-agenda-mode . lin-mode)
	 (org-store-link-functions . cq/org-elfeed-entry-store-link))
  :config
  (require 'org-protocol)
  (setq org-directory "~/Documents/org")
  (setq org-agenda-files (list (concat org-directory "/productivity/todo.org")))
  (setq org-archive-location (concat org-directory "/productivity/archive.org::* From %s"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline
			     (lambda () (concat org-directory "/productivity/todo.org"))
			     "Inbox")
           "* TODO %? %^G\n %i\n %a %u")
	  ("c" "Todo" entry (file+headline
			     (lambda () (concat org-directory "/productivity/todo.org"))
			     "Inbox")
           "* TODO %?%a\n %u")
	  ("l" "Elfeed reading list" entry (file+headline
					    (lambda () (concat
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

(use-package python
  :custom
  (python-shell-interpreter "python3"))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "s-l")
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-idle-delay 0.500)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-modeline-diagnostics-enable t))

(use-package lsp-python-ms
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp-deferred))))

(use-package ledger-mode
  :config
  (setq ledger-binary-path (executable-find "hledger"))
  (setq ledger-mode-should-check-version nil)
  (setq ledger-report-native-highlighting-arguments '("--color=always")))

(use-package envrc
  :init (envrc-global-mode))

(use-package lin)

;; https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg
;; overriding image.el function image-type-available-p
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))

(use-package denote
  :hook (find-file . denote-link-buttonize-buffer)
  :bind (
	 ("C-c n j" . cq/create-denote-journal-entry)
	 ("C-c n n" . denote)
	 ("C-c n N" . denote-type)
	 ("C-c n i" . denote-link)
	 ("C-c n I" . denote-link-add-links)
	 ("C-c n b" . denote-link-backlinks)
	 ("C-c n f f" . denote-link-find-file)
	 ("C-c n f b" . denote-link-find-backlink)
	 ("C-c n r" . denote-rename-file)
	 ("C-c n R" . denote-rename-file-using-front-matter)
	 ("C-c n d" . cq/open-denote-directory)
	 ("C-c n ." . cq/insert-time-stamp))
  :config
  (setq crm-separator ",")
  (setq denote-directory "~/Documents/notes")
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  (setq denote-file-type 'text)
  (setq denote-prompts '(title keywords))
  (defun cq/create-denote-journal-entry ()
    (interactive)
    (denote
     (denote-title-prompt)
     '("journal")))
  (defun cq/open-denote-directory ()
    (interactive)
    (revert-buffer (dired denote-directory)))
  (defun cq/insert-time-stamp ()
    (interactive)
    (insert (current-time-string))))

(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap ("C-x p" . projectile-command-map)
  :config
  (setq projectile-project-search-path '("~/workspace/" "~/.emacs.d/"))
  (setq projectile-indexing-method 'alien))

(use-package org-alert
  :config
  (if (eq system-type 'darwin)
      (setq
       alert-default-style 'osx-notifier)
    (setq alert-default-style 'libnotify))
  (defun org-alert--dispatch ()
    (let* ((entry (org-alert--parse-entry))
	   (head (car entry))
	   (time (cadr entry)))
      (if time
	  (when (org-alert--check-time time)
	    (alert (concat time ": " head) :title org-alert-notification-title)))))
  (setq org-alert-interval 30)
  (setq org-alert-notify-cutoff 5)
  (setq org-alert-notify-after-event-cutoff 10)
  (setq org-alert-notification-title "Reminder")
  (setq org-alert-time-match-string
	"\\(?:SCHEDULED\\|DEADLINE\\):.*?<.*?\\([0-9]\\{2\\}:[0-9]\\{2\\}\\).*>")
  (org-alert-enable))

(use-package eww
  :config
  (defun cq/search-word ()
    (interactive)
    (let ((word (if (use-region-p)
		    (buffer-substring-no-properties (region-beginning) (region-end))
		  (read-string "Word lookup: "))))
      (if (eq system-type 'darwin)
	  (shell-command (format "open dict://%s" (shell-quote-argument word)))
	  (eww (concat "https://en.wiktionary.org/wiki/" word) 4)))))
