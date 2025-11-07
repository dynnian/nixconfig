;;; config.el --- Dynn's Doom Emacs config -*- lexical-binding: t; -*-
;; Author: Lian Dynn
;; Description: Dynn's personal Doom Emacs config.
;; Startup: showeverything

;; =============================================================================
;; BEACON
;; Never lose your cursor. When you scroll, your cursor will shine!
;; Global minor-mode: enable everywhere.
;; =============================================================================
(beacon-mode 1)


;; =============================================================================
;; BOOKMARKS AND BUFFERS
;; Doom Emacs uses `SPC b` for buffer-related keybindings.
;; -----------------------------------------------------------------------------
;; Buffers
;; The text you edit resides in a buffer. Visiting files, Dired listings, etc.,
;; all live in buffers. `ibuffer` lists buffers with filtering and navigation.
;;
;; | COMMAND         | DESCRIPTION          | KEYBINDING |
;; |-----------------+----------------------+------------|
;; | ibuffer         | Launch ibuffer       | SPC b i    |
;; | kill-buffer     | Kill current buffer  | SPC b k    |
;; | next-buffer     | Goto next buffer     | SPC b n    |
;; | previous-buffer | Goto previous buffer | SPC b p    |
;; | save-buffer     | Save current buffer  | SPC b s    |
;; -----------------------------------------------------------------------------

;; Global Auto Revert
;; A buffer can fall out of sync if its file changes externally. Keep it fresh:
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Keybindings within ibuffer mode
;; | COMMAND                           | DESCRIPTION                            | KEYBINDING |
;; |-----------------------------------+----------------------------------------+------------|
;; | ibuffer-mark-forward              | Mark the buffer                        | m          |
;; | ibuffer-unmark-forward            | Unmark the buffer                      | u          |
;; | ibuffer-do-kill-on-deletion-marks | Kill the marked buffers                | x          |
;; | ibuffer-filter-by-content         | Ibuffer filter by content              | f c        |
;; | ibuffer-filter-by-directory       | Ibuffer filter by directory            | f d        |
;; | ibuffer-filter-by-filename        | Ibuffer filter by filename (full path) | f f        |
;; | ibuffer-filter-by-mode            | Ibuffer filter by mode                 | f m        |
;; | ibuffer-filter-by-name            | Ibuffer filter by name                 | f n        |
;; | ibuffer-filter-disable            | Disable ibuffer filter                 | f x        |
;; | ibuffer-do-kill-lines             | Hide marked buffers                    | g h        |
;; | ibuffer-update                    | Restore hidden buffers                 | g H        |
(evil-define-key 'normal ibuffer-mode-map
  (kbd "f c") #'ibuffer-filter-by-content
  (kbd "f d") #'ibuffer-filter-by-directory
  (kbd "f f") #'ibuffer-filter-by-filename
  (kbd "f m") #'ibuffer-filter-by-mode
  (kbd "f n") #'ibuffer-filter-by-name
  (kbd "f x") #'ibuffer-filter-disable
  (kbd "g h") #'ibuffer-do-kill-lines
  (kbd "g H") #'ibuffer-update)


;; =============================================================================
;; DIRED
;; Emacs’ file manager.
;; With dired-open you can launch external programs per extension.
;; =============================================================================
(setq dired-open-extensions '(("gif" . "vimiv")
                              ("jpg" . "vimiv")
                              ("png" . "vimiv")
                              ("mkv" . "mpv")
                              ("mp3" . "mpv")
                              ("mp4" . "mpv")))

;; Keybindings within Dired when peep-dired-mode is enabled
;; Toggle previews: `SPC d p`
;; j/k move preview to next/prev file.
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") #'peep-dired-next-file
  (kbd "k") #'peep-dired-prev-file)
(add-hook 'peep-dired-hook #'evil-normalize-keymaps)

;; Making deleted files go to trash can
(setq delete-by-moving-to-trash t
      trash-directory "~/.local/share/Trash/files/")


;; =============================================================================
;; DOOM THEME
;; Set theme; quick try themes via `SPC h t`.
;; =============================================================================
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)
(map! :leader
      :desc "Load new theme" "h t" #'load-theme)


;; =============================================================================
;; FONTS
;; doom-font: primary monospace font
;; doom-variable-pitch-font: variable font for some plugins
;; doom-big-font: for presentations (doom-big-font-mode)
;; Also enable bold/italic in doom-themes; italicize comments/keywords.
;; =============================================================================
(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 14)
      doom-variable-pitch-font (font-spec :family "Mononoki Nerd Font" :size 14)
      doom-big-font (font-spec :family "Mononoki Nerd Font" :size 20))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))


;; =============================================================================
;; INSERT DATE
;; `drk/insert-todays-date` supports universal prefix:
;;  - none      -> "Friday, November 19, 2021"
;;  - C-u       -> "11-19-2021"
;;  - C-u C-u   -> "2021-11-19"
;; `drk/insert-any-date` -> pick any date, same long format.
;;
;; | COMMAND                | EXAMPLE OUTPUT            | KEYBINDING            |
;; |------------------------+---------------------------+-----------------------|
;; | drk/insert-todays-date | Friday, November 19, 2021 | SPC i d t             |
;; | drk/insert-todays-date | 11-19-2021                | SPC u SPC i d t       |
;; | drk/insert-todays-date | 2021-11-19                | SPC u SPC u SPC i d t |
;; | drk/insert-any-date    | Friday, November 19, 2021 | SPC i d a             |
;; =============================================================================
(defun drk/insert-todays-date (prefix)
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%A, %B %d, %Y")
                 ((equal prefix '(4)) "%m-%d-%Y")
                 ((equal prefix '(16)) "%Y-%m-%d"))))
    (insert (format-time-string format))))

(require 'calendar)
(defun drk/insert-any-date (date)
  "Insert DATE using the current locale."
  (interactive (list (calendar-read-date)))
  (insert (calendar-date-string date)))

(map! :leader
      (:prefix ("i d" . "Insert date")
       :desc "Insert any date"    "a" #'drk/insert-any-date
       :desc "Insert todays date" "t" #'drk/insert-todays-date))


;; =============================================================================
;; LINE SETTINGS
;; comment-line on `SPC TAB TAB`. Other toggles live under `SPC t`.
;;
;; | COMMAND                  | DESCRIPTION                               | KEYBINDING  |
;; |--------------------------+-------------------------------------------+-------------|
;; | comment-line             | Comment or uncomment lines                | SPC TAB TAB |
;; | hl-line-mode             | Toggle line highlighting in current frame | SPC t h     |
;; | global-hl-line-mode      | Toggle line highlighting globally         | SPC t H     |
;; | doom/toggle-line-numbers | Toggle line numbers                       | SPC t l     |
;; | toggle-truncate-lines    | Toggle truncate lines                     | SPC t t     |
;; =============================================================================
(setq display-line-numbers-type t)

(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers"           "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight (frame)" "h" #'hl-line-mode
       :desc "Toggle line highlight (global)""H" #'global-hl-line-mode
       :desc "Toggle truncate lines"         "t" #'toggle-truncate-lines))


;; =============================================================================
;; LSP
;; Autostart lsp for programming languages
;; - C#: use csharp-ls installed as a dotnet tool
;; - Go, Rust: defer LSP on mode hooks
;; =============================================================================
(after! lsp-mode
  (setq lsp-csharp-csharpls-use-dotnet-tool t))

(add-hook 'csharp-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook     #'lsp-deferred)
(add-hook 'rust-mode-hook   #'lsp-deferred)


;; =============================================================================
;; MARKDOWN
;; Header faces with Mononoki Nerd Font and scaled sizes.
;; =============================================================================
(custom-set-faces
 '(markdown-header-face   ((t (:inherit font-lock-function-name-face :weight bold :family "Mononoki Nerd Font"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.1))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.0)))))


;; =============================================================================
;; MODELINE
;; Doom modeline settings and font.
;; For more: https://github.com/seagle0128/doom-modeline
;; =============================================================================
(set-face-attribute 'mode-line nil :font "Mononoki Nerd Font-12")
(setq doom-modeline-height 30     ;; sets modeline height
      doom-modeline-bar-width 5   ;; sets right bar width
      doom-modeline-persp-name t  ;; adds perspective name
      doom-modeline-persp-icon t) ;; adds folder icon next to persp name


;; =============================================================================
;; MOUSE SUPPORT
;; Enable mouse in terminal Emacs.
;; =============================================================================
(xterm-mouse-mode 1)


;; =============================================================================
;; NEOTREE
;; 1) `SPC e` toggles neotree
;; 2) Prettier nerd theme
;; 3) Smart-open current file on show
;; 4) On `projectile-switch-project` (SPC p p), neotree changes root automatically
;; =============================================================================
(map! :leader
      :desc "Toggle neotree" "e" #'neotree-toggle)
(setq neo-theme 'nerd)
(setq neo-smart-open t)
(setq projectile-switch-project-action #'neotree-projectile-action)


;; =============================================================================
;; ORG MODE
;; Wrap in (after! org) so Doom defaults don't clobber our settings.
;; (+journal +pretty +roam2) should be enabled in init.el under :lang org.
;; =============================================================================
(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)

(after! org
  (setq org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        ;; change +/- symbols in item lists
        org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦))
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; Fancy priorities (requires pretty/fancy support)
        org-fancy-priorities-list '("󰈼" "󰈻" "󰈽")
        org-priority-faces
        '((?A :foreground "#fb4934" :weight bold)
          (?B :foreground "#fabd2f" :weight bold)
          (?C :foreground "#83a598" :weight bold))))

;; Org-publish
(setq org-publish-use-timestamps-flag nil)
(setq org-export-with-broken-links t)

;; Org-auto-tangle: add #+auto_tangle: t in an Org file to auto-tangle on save.
(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))


;; =============================================================================
;; RAINBOW MODE
;; Display actual colors for hex values everywhere via a globalized mode.
;; =============================================================================
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(global-rainbow-mode 1)


;; =============================================================================
;; SHELLS
;; shell-file-name: used by M-x shell/term/ansi-term/vterm
;; Also map a quick vterm popup toggle.
;; =============================================================================
(setq shell-file-name (executable-find "fish")
      vterm-max-scrollback 10000)


;; =============================================================================
;; SPLITS
;; Prefer horizontal (open on the right). Provide a binding to clone an indirect
;; buffer into another window (same text, independent view).
;; =============================================================================
(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil t)
  (set-variable 'split-width-threshold 40 t)) ;; lower to force horizontal
(add-hook 'markdown-mode-hook #'prefer-horizontal-split)

(map! :leader
      :desc "Clone indirect buffer other window" "b c" #'clone-indirect-buffer-other-window)


;; =============================================================================
;; TRANSPARENT
;; Make frames translucent.
;; =============================================================================
(add-to-list 'default-frame-alist '(alpha-background . 80)) ;; new frames


;; =============================================================================
;; WINNER MODE
;; Undo/redo window configurations with:
;;   SPC w <left>  -> winner-undo
;;   SPC w <right> -> winner-redo
;; (Winner mode ships with Emacs; Doom usually enables it by default.)
;; =============================================================================
(map! :leader
      (:prefix ("w" . "window")
       :desc "Winner redo" "<right>" #'winner-redo
       :desc "Winner undo" "<left>"  #'winner-undo))
;;; config.el ends here
