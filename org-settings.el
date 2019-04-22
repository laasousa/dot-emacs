(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfw:read-date-command
   (lambda nil
     (interactive)
     (let
         ((xs
           (decode-time
            (org-time-string-to-time
             (org-read-date)))))
       (list
        (nth 4 xs)
        (nth 3 xs)
        (nth 5 xs)))))
 '(deft-directory "~/Documents/notes")
 '(deft-text-mode (quote org-mode))
 '(deft-use-filename-as-title t)
 '(jobhours-files
   (quote
    ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/dfinity.org")))
 '(org-M-RET-may-split-line (quote ((headline) (default . t))))
 '(org-adapt-indentation nil)
 '(org-agenda-auto-exclude-function (quote org-my-auto-exclude-function))
 '(org-agenda-cmp-user-defined (quote org-compare-todo-age))
 '(org-agenda-custom-commands
   (quote
    (("h" "Current Hotlist" alltodo ""
      ((org-agenda-overriding-header "Current Hotlist")
       (org-agenda-skip-function
        (function my-org-agenda-skip-all-siblings-but-first-hot))))
     ("H" "Hot Projects" tags "HOT&TODO=\"PROJECT\""
      ((org-agenda-overriding-header "Hot Projects")))
     ("T" "Non-Hot Projects" tags "-HOT&TODO=\"PROJECT\""
      ((org-agenda-overriding-header "Non-Hot Projects")))
     ("n" "Project Next Actions" alltodo ""
      ((org-agenda-overriding-header "Project Next Actions")
       (org-agenda-skip-function
        (function my-org-agenda-skip-all-siblings-but-first))))
     ("P" "All Projects" todo-tree "PROJECT"
      ((org-agenda-overriding-header "All Projects")))
     ("A" "Priority #A tasks" agenda ""
      ((org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's priority #A tasks: ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote notregexp)
          "\\=.*\\[#A\\]")))))
     ("b" "Priority #A and #B tasks" agenda ""
      ((org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's priority #A and #B tasks: ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote regexp)
          "\\=.*\\[#C\\]")))))
     ("r" "Uncategorized items" tags "CATEGORY=\"Inbox\"&LEVEL=2"
      ((org-agenda-overriding-header "Uncategorized items")))
     ("w" "Waiting/delegated tasks" tags "W-TODO=\"DONE\"|TODO={WAITING\\|DELEGATED}"
      ((org-agenda-overriding-header "Waiting/delegated tasks:")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote scheduled))))
       (org-agenda-sorting-strategy
        (quote
         (todo-state-up priority-down category-up)))))
     ("D" "Deadlined tasks" tags "TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}"
      ((org-agenda-overriding-header "Deadlined tasks: ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote notdeadline))))
       (org-agenda-sorting-strategy
        (quote
         (category-up)))))
     ("S" "Scheduled tasks" tags "TODO<>\"\"&TODO<>{APPT\\|DONE\\|CANCELED\\|NOTE\\|PROJECT}&STYLE<>\"habit\""
      ((org-agenda-overriding-header "Scheduled tasks: ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote notscheduled))))
       (org-agenda-sorting-strategy
        (quote
         (category-up)))))
     ("d" "Unscheduled open source tasks (by date)" tags "TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}"
      ((org-agenda-overriding-header "Unscheduled Open Source tasks (by date): ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote scheduled)
          (quote deadline)
          (quote timestamp)
          (quote regexp)
          "\\* \\(DEFERRED\\|SOMEDAY\\)")))
       (org-agenda-sorting-strategy
        (quote
         (user-defined-up)))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")
       (org-agenda-files
        (quote
         ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/OSS.org")))))
     ("o" "Unscheduled open source tasks (by project)" tags "TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}"
      ((org-agenda-overriding-header "Unscheduled Open Source tasks (by project): ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote scheduled)
          (quote deadline)
          (quote timestamp)
          (quote regexp)
          "\\* \\(DEFERRED\\|SOMEDAY\\)")))
       (org-agenda-sorting-strategy
        (quote
         (category-up)))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")
       (org-agenda-files
        (quote
         ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/OSS.org")))))
     ("u" "Unscheduled tasks" tags "TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT\\|DEFERRED\\|SOMEDAY}"
      ((org-agenda-overriding-header "Unscheduled tasks: ")
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote scheduled)
          (quote deadline)
          (quote timestamp))))
       (org-agenda-sorting-strategy
        (quote
         (user-defined-up)))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")
       (org-agenda-files
        (quote
         ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/Bahai.org")))))
     ("U" "Deferred tasks" tags "TODO=\"DEFERRED\""
      ((org-agenda-overriding-header "Deferred tasks:")
       (org-agenda-sorting-strategy
        (quote
         (user-defined-up)))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")))
     ("Y" "Someday tasks" tags "TODO=\"SOMEDAY\""
      ((org-agenda-overriding-header "Someday tasks:")
       (org-agenda-sorting-strategy
        (quote
         (user-defined-up)))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")))
     ("W" "Unscheduled work-related tasks" tags "TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}"
      ((org-agenda-overriding-header "Unscheduled work-related tasks")
       (org-agenda-files
        (quote
         ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org")))
       (org-agenda-sorting-strategy
        (quote
         (todo-state-up priority-down category-up)))
       (org-agenda-skip-function
        (quote
         (org-agenda-skip-entry-if
          (quote scheduled)
          (quote deadline)
          (quote timestamp))))
       (org-agenda-prefix-format "%-11c%5(org-todo-age) ")))
     ("c" "Appointment Calendar" agenda ""
      ((org-agenda-overriding-header "Appointment Calendar")
       (org-agenda-sorting-strategy
        (quote
         (time-up)))
       (org-agenda-span 14)
       (org-agenda-ndays 14)
       (org-agenda-regexp-filter-preset
        (quote
         ("+APPT")))))
     ("O" "All TODOs" tags "TODO<>\"\""
      ((org-agenda-overriding-header "All TODOs")
       (org-agenda-files
        (quote
         ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/Bahai.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/OSS.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/habits.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/index.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/dfinity.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/Bahai.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/BoostPro.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/CEG.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/Embarcadero.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/FPComplete.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/IL-05.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/TI.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2007.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2008.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2009.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2010.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2011.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2012.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2013.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2014.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2015.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2016.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive-2017.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/archive.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/archive/emacs.org"))))))))
 '(org-agenda-deadline-leaders (quote ("!D!: " "D%02d: ")))
 '(org-agenda-default-appointment-duration 60)
 '(org-agenda-files
   (quote
    ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/habits.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/Bahai.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/OSS.org")))
 '(org-agenda-fontify-priorities t)
 '(org-agenda-include-diary t)
 '(org-agenda-inhibit-startup t)
 '(org-agenda-log-mode-items (quote (closed clock state)))
 '(org-agenda-ndays 1)
 '(org-agenda-persistent-filter t)
 '(org-agenda-prefix-format
   (quote
    ((agenda . "  %-11c%?-12t% s")
     (timeline . "  % s")
     (todo . "  %-11c%5(org-todo-age) ")
     (tags . "  %-11c"))))
 '(org-agenda-scheduled-leaders (quote ("" "S%d: ")))
 '(org-agenda-scheduled-relative-text "S%d: ")
 '(org-agenda-scheduled-text "")
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-unavailable-files t)
 '(org-agenda-sorting-strategy
   (quote
    ((agenda habit-down time-up todo-state-up priority-down)
     (todo priority-down category-keep)
     (tags priority-down category-keep)
     (search category-keep))))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-tags-column -100)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-text-search-extra-files
   (quote
    (agenda-archives "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org")))
 '(org-agenda-todo-ignore-scheduled (quote past))
 '(org-agenda-use-time-grid nil)
 '(org-archive-location "TODO-archive::")
 '(org-archive-save-context-info (quote (time category itags)))
 '(org-attach-file-list-property nil)
 '(org-attach-method (quote mv))
 '(org-attach-store-link-p (quote attached))
 '(org-author-transforms (quote (("^Howard Reubenstein$" . "Howard"))))
 '(org-beamer-frame-default-options "fragile")
 '(org-capture-templates
   (quote
    (("a" "Add Task" entry
      (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Inbox")
      "* TODO %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :prepend t)
     ("n" "Note" entry
      (file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org")
      "* NOTE %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :prepend t)
     ("c" "Calendar" entry
      (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Inbox")
      "* APPT %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :prepend t)
     ("t" "Add Task" entry
      (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Inbox")
      "* TODO %?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :prepend t)
     ("p" "Protocol" entry
      (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Inbox")
      "* NOTE %?
#+BEGIN_QUOTE
%i
#+END_QUOTE
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:URL:      %c
:END:")
     ("L" "Protocol Link" entry
      (file+headline "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" "Inbox")
      "* NOTE %?
[[%:link][%:description]]
#+BEGIN_QUOTE
%i
#+END_QUOTE
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:URL:      %c
:END:")
     ("j" "Journal entry" entry
      (file+datetree "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org")
      "* %?"))))
 '(org-clock-clocked-in-display nil)
 '(org-clock-idle-time 10)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state "STARTED")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-mode-line-total (quote current))
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-out-switch-to-state nil)
 '(org-clock-persist t)
 '(org-clock-persist-file "~/.emacs.d/data/org-clock-save.el")
 '(org-clock-resolve-expert t)
 '(org-completion-use-ido t)
 '(org-confirm-babel-evaluate nil)
 '(org-confirm-elisp-link-function nil)
 '(org-confirm-shell-link-function nil)
 '(org-crypt-disable-auto-save t)
 '(org-crypt-key "0xAB37611BDDE48EBD")
 '(org-cycle-global-at-bob t)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file
   "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org")
 '(org-depend-tag-blocked nil)
 '(org-directory
   "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/")
 '(org-ditaa-jar-path "/run/current-system/sw/lib/ditaa.jar")
 '(org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "OUT")))
 '(org-edit-src-content-indentation 0)
 '(org-enforce-todo-dependencies t)
 '(org-export-babel-evaluate nil)
 '(org-export-latex-classes
   (quote
    (("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("linalg" "\\documentclass{article}
\\usepackage{linalgjh}
[DEFAULT-PACKAGES]
[EXTRA]
[PACKAGES]"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("beamer" "\\documentclass{beamer}" org-beamer-sectioning))))
 '(org-extend-today-until 8)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-footnote-section nil)
 '(org-gcal-dir "~/.emacs.d/data/org-gcal/")
 '(org-habit-preceding-days 42)
 '(org-habit-today-glyph 45)
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-icalendar-combined-agenda-file
   "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/org.ics")
 '(org-icalendar-timezone "America/Los_Angeles")
 '(org-id-locations-file "~/.emacs.d/data/org-id-locations")
 '(org-image-actual-width (quote (800)))
 '(org-imenu-depth 4)
 '(org-insert-heading-respect-content t)
 '(org-irc-link-to-logs t t)
 '(org-latex-default-packages-alist
   (quote
    (("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000")))
 '(org-latex-listings (quote minted))
 '(org-latex-minted-options
   (quote
    (("fontsize" "\\footnotesize")
     ("linenos" "true")
     ("xleftmargin" "0em"))))
 '(org-latex-pdf-process
   (quote
    ("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f" "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
 '(org-mobile-agendas (quote ("Z")))
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-files
   (quote
    ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org")))
 '(org-mobile-files-exclude-regexp "\\(TODO\\(-.*\\)?\\)\\'")
 '(org-mobile-inbox-for-pull
   "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/from-mobile.org")
 '(org-mode-hook
   (quote
    (org-babel-result-hide-spec org-babel-hide-all-hashes abbrev-mode)))
 '(org-modules (quote (org-gnus org-habit org-info org-depend)))
 '(org-plantuml-jar-path "/run/current-system/sw/lib/plantuml.jar")
 '(org-pretty-entities t)
 '(org-priority-faces
   (quote
    ((65 :foreground "White" :weight bold)
     (66 . "White")
     (67 :foreground "dark gray" :slant italic))))
 '(org-refile-target-verify-function (quote org-refile-heading-p))
 '(org-refile-targets
   (quote
    (("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todo.org" :level . 1)
     ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/dfinity.org" :level . 1)
     ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/Bahai.org" :level . 1)
     ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/OSS.org" :level . 1)
     (org-agenda-files :todo . "PROJECT"))))
 '(org-return-follows-link t)
 '(org-reverse-note-order t)
 '(org-smart-capture-use-lastname t)
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-stuck-projects (quote ("TODO=\"PROJECT\"" ("TODO" "DEFERRED") nil "")))
 '(org-subject-transforms
   (quote
    (("\\`\\(Re\\|Fwd\\): " . "")
     ("\\`{ledger} " . "")
     ("([Ww]as: .+)\\'" . "")
     ("\\`\\[[a-z-]+\\] " . "")
     ("\\`bug#\\([0-9]+\\):" . "[[x-debbugs-gnu:\\1][#\\1]]"))))
 '(org-tags-column -97)
 '(org-time-clocksum-use-fractional t)
 '(org-todo-keyword-faces
   (quote
    (("TODO" :foreground "medium blue" :weight bold)
     ("EPIC" :foreground "deep sky blue" :weight bold)
     ("STORY" :foreground "royal blue" :weight bold)
     ("RECUR" :foreground "cornflowerblue" :weight bold)
     ("APPT" :foreground "medium blue" :weight bold)
     ("NOTE" :foreground "brown" :weight bold)
     ("STARTED" :foreground "dark orange" :weight bold)
     ("WAITING" :foreground "red" :weight bold)
     ("DELEGATED" :foreground "dark violet" :weight bold)
     ("DEFERRED" :foreground "dark blue" :weight bold)
     ("SOMEDAY" :foreground "dark blue" :weight bold)
     ("PROJECT" :foreground "#088e8e" :weight bold))))
 '(org-todo-repeat-to-state "TODO")
 '(org-use-property-inheritance (quote ("AREA")))
 '(org-use-speed-commands t)
 '(org-use-tag-inheritance nil)
 '(org-velocity-always-use-bucket t)
 '(org-velocity-bucket
   "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org")
 '(org-velocity-capture-templates
   (quote
    (("v" "Velocity" entry
      (file "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/notes.org")
      "* NOTE %:search
%i%?
:PROPERTIES:
:ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
:END:" :prepend t))))
 '(org-velocity-exit-on-match nil)
 '(org-velocity-force-new t)
 '(org-velocity-search-method (quote regexp))
 '(org-velocity-use-completion t)
 '(org-x-backends (quote (ox-org ox-redmine)))
 '(org-x-redmine-title-prefix-function (quote org-x-redmine-title-prefix))
 '(org-x-redmine-title-prefix-match-function (quote org-x-redmine-title-prefix-match)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-clocking ((t (:background "red2"))) t)
 '(org-agenda-done ((t (:foreground "ForestGreen"))))
 '(org-done ((t (:foreground "ForestGreen" :weight bold))))
 '(org-habit-alert-face ((((background light)) (:background "#f5f946"))))
 '(org-habit-alert-future-face ((((background light)) (:background "#fafca9"))))
 '(org-habit-clear-face ((((background light)) (:background "#8270f9"))))
 '(org-habit-clear-future-face ((((background light)) (:background "#d6e4fc"))))
 '(org-habit-overdue-face ((((background light)) (:background "#f9372d"))))
 '(org-habit-overdue-future-face ((((background light)) (:background "#fc9590"))))
 '(org-habit-ready-face ((((background light)) (:background "#4df946"))))
 '(org-habit-ready-future-face ((((background light)) (:background "#acfca9"))))
 '(org-headline-done ((t (:foreground "grey75" :strike-through t :slant italic))))
 '(org-level-4 ((t (:foreground "green"))))
 '(org-scheduled ((((class color) (min-colors 88) (background light)) nil)))
 '(org-upcoming-deadline ((((class color) (min-colors 88) (background light)) (:foreground "Brown")))))
