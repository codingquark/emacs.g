(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

(use-package flyspell
  :config
  (setq ispell-program-name "aspell"))

(use-package erc
  :bind ("C-c i e" . (lambda () (interactive)
                       (when (get-buffer "#emacs")
                         (switch-to-buffer "#emacs"))))
  :config
  (setq erc-hide-list '("JOIN" "PART" "QUIT"))
  (setq erc-keywords '("codingquark" "codingquark_"))
  (setq erc-join-buffer 'bury)
  (setq erc-server-reconnect-attempts 5)
  (setq erc-server-reconnect-timeout 3)
  (erc-completion-mode 1))

(use-package znc
  :config
  (setq znc-servers
        '(("znc.tilde.team" 6699 t
           ((freenode "codingquark/freenode")
            (oftc "codingquark/oftc"))))))

(use-package erc-hl-nicks
  :config
  (erc-hl-nicks))

(use-package erc-log
  :init
  (progn
    (setq erc-log-channels-directory "~/log/")
    (if (not (file-exists-p erc-log-channels-directory))
        (mkdir erc-log-channels-directory t))
    (setq erc-save-buffer-on-part t)
    (setq erc-save-queries-on-quit t)))

(use-package erc-spelling
  :init
  (erc-spelling-mode t))

(use-package erc-terminal-notifier
  :if (memq window-system '(mac ns))
  :config
  (setq erc-terminal-notifier-command "terminal-notifier"))

(use-package modus-themes
  :init
  (modus-themes-load-themes)
  :hook ((after-init . modus-themes-load-operandi))
  :bind ("<f5>" . modus-themes-toggle))

(use-package elfeed
  :config
  (setq elfeed-use-curl t)
  (setq elfeed-curl-max-connections 20)
  (setq elfeed-search-title-max-width 80)
  (setq elfeed-feeds
        '(("https://cjb.sh/articles/feed.xml" blog emacs)
          ("http://planet.emacslife.com/atom.xml" blog emacs planet)
          "https://babbagefiles.xyz/posts/atom.xml"
          ("http://www.shakthimaan.com/news.xml" emacs)
          ("https://blog.steve.fi/index.rss" blog debian)
          ("http://technomancy.us/feed/atom.xml" blog emacs)
          ("http://dreamcafe.com/feed/" author musician blog)
          ("https://lispblog.xach.com/rss" blog lisp)
          ("http://www.aidalgolland.net/feed.xml" blog emacs)
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
          ("https://martinfowler.com/feed.atom" tech author)
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
          "https://www.crummy.com/rss.xml"
          "https://craphound.com/feed"
	  ("https://www.murilopereira.com/index.xml" blog emacs)
	  ("https://www.scottaaronson.com/blog/?feed=rss2" uncertain)
	  ("https://thezvi.wordpress.com/feed/" uncertain)
	  ("https://www.hamvocke.com/feed.xml" blog uncertain)
	  ("https://world.hey.com/dhh/feed.atom" blog uncertain)
	  ("https://medium.com/feed/@@nic__carter" blog cryptocurrencies)
	  ("https://sathyabh.at/index.xml" blog tech)
	  ("https://sathyasays.com/index.xml" blog tech)
	  ("http://philhart.com/rss.xml" astronomy science)
	  ("https://apod.nasa.gov/apod.rss" astronomy science)
	  ("https://www.peterzelinka.com/blog.rss"  astronomy science)
          ))
  :bind ("C-c e" . elfeed))

(use-package icomplete
  :init
  (icomplete-mode)
  :config
  (setq completion-ignore-case t)
  (setq tab-always-indent 'complete)
  (setq read-buffer-completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  (setq completion-cycle-threshold t)
  (setq icomplete-prospects-height 1)
  (setq completion-styles '(flex partial-completion initials)))

(use-package dired-aux
  :config
  (setq dired-isearch-filenames 'dwim)
  (setq dired-create-destination-dirs 'ask)
  (setq dired-vc-rename-file t))


(use-package project
  :init
  (setq project-switch-commands
        '((?f "File" project-find-file)
          (?g "Grep" project-find-regexp)
          (?d "Dired" project-dired)
          (?b "Buffer" project-switch-to-buffer)
          (?q "Query replace" project-query-replace-regexp)
          (?s "vterm" project-vterm)))
  :config
  (defun project-vterm ()
    "Start vterm in the current project's root directory.
If a buffer already exists for running a vterm in the project's
root, switch to it.  Otherwise, create a new vterm buffer.  With
\\[universal-argument] prefix arg, create a new inferior vterm
buffer even if one already exists."
    (interactive)
    (let* ((default-directory (project-root (project-current t)))
           (default-project-vterm-name
             (concat "*" (file-name-nondirectory
                          (directory-file-name
                           (file-name-directory default-directory)))
                     "-vterm*"))
           (vterm-buffer (get-buffer default-project-vterm-name)))
      (if (and vterm-buffer (not current-prefix-arg))
          (pop-to-buffer vterm-buffer)
        (vterm (generate-new-buffer-name default-project-vterm-name)))))
  :bind(:map project-prefix-map
             ("s" . project-vterm)))

(use-package ibuffer
  :config
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-movement-cycle nil)
  (setq ibuffer-use-header-line t)
  (setq ibuffer-default-sorting-mode 'filename/process)
  :bind (("C-x C-b" . ibuffer))
  :hook (ibuffer-mode . hl-line-mode))

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
         ("s-q" . window-toggle-side-windows)))

(use-package winner
  :hook (after-init . winner-mode)
  :bind (("<s-right>" . winner-redo)
         ("<s-left>" . winner-undo)))

(use-package battery
  :config
  (setq battery-mode-line-format " [%b%p%%]")
  (setq battery-mode-line-limit 95)
  (setq battery-update-interval 180)
  (setq battery-load-low 20)
  (setq battery-load-critical 10)
  :hook (after-init . display-battery-mode))

(use-package time
  :config
  (setq display-time-format "%H:%M  %Y-%m-%d")
  (setq display-time-interval 60)
  (setq display-time-mail-directory nil)
  (setq display-time-default-load-average nil)
  :hook (after-init . display-time-mode))

(use-package emacs
  :config
  (setq window-divider-default-right-width 1)
  (setq window-divider-default-bottom-width 1)
  (setq window-divider-default-places 'right-only)
  :hook (after-init . window-divider-mode)
  :bind (("s-k" . kill-buffer)))

(use-package fringe
  :config
  (fringe-mode nil)
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
  :hook (after-init . (lambda ()
                        (electric-indent-mode 1)
                        (electric-pair-mode -1)
                        (electric-quote-mode -1))))

(use-package yaml-mode
  :mode "\\.ya?ml\\'")

(use-package vterm
  :config
  (setq vterm-max-scrollback 2000))

(use-package faces
  :ensure nil
  :custom
  (face-font-family-alternatives '(("Menlo" "Iosevka" "DejaVu Sans Mono" "Monospace")))
  :init
  (set-face-attribute 'default nil
                      :family (caar face-font-family-alternatives)
                      :weight 'regular
                      :width 'semi-condensed
                      :height 120))

(use-package markdown-mode
  ;; To enable editing of code blocks in indirect buffers using C-c ’,
  ;; you will need to install the edit-indirect package.
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package org
  :bind (("C-c c" . org-capture)
	 ("C-c a" . org-agenda))
  :hook ((org-mode . auto-fill-mode))
  :config
  (setq org-directory "~/Documents/org")
  (setq org-agenda-files (list (concat org-directory "/todo.org")))
  (setq org-archive-location (concat org-directory "/archive.org::* From %s"))
  (setq org-capture-templates
        '(("t" "Todo" entry (file (lambda () (concat org-directory "/todo.org")))
           "* TODO %? %^G\n %i\n %a %u"))))

(use-package org-brain
  :init
  (setq org-brain-path "~/Documents/org/brain")
  :config
  (bind-key "C-c b" org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
	  "* %i%?" :empty-lines 1)
	org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries t
	org-brain-file-entries-use-title t))

(use-package dockerfile-mode
  :mode "Dockerfile\\'")
