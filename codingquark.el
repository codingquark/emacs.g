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
  (setq erc-hide-list '("JOIN" "PART" "QUIT")
	erc-keywords '("codingquark" "codingquark_"))
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
  :hook ((after-init-hook . modus-themes-load-operandi))
  :bind ("<f5>" . modus-themes-toggle))

(use-package elfeed
  :init
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
          ("https://decoded.legal/blog/feed/rss" uncertain)
          ("http://bach.ai/feed.xml" science blog)
          ("https://write.as/minimalistedtech/feed/" uncertain)
          ("http://norvig.com/rss-feed.xml" author tech science)
          ("https://shuaibwriteskhanthinks.wordpress.com/feed/" uncertain)
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
          "https://blog.mattedgar.com/feed/"
          "https://yihui.org/en/index.xml"
          "https://supersciencegrl.co.uk/rss.xml"
          ("https://www.solipsys.co.uk/rss.xml" math blog)
          "https://www.crummy.com/rss.xml"
          "https://craphound.com/feed"
          ))
  :bind ("C-x w" . elfeed))
