;; proof-easy-config.el    Easy configuration for Proof General
;;
;; Copyright (C) 1999  David Aspinall / LFCS.
;; Author:     David Aspinall <da@dcs.ed.ac.uk>
;; Maintainer: Proof General maintainer <proofgen@dcs.ed.ac.uk>
;;
;; $Id$
;;
;; Future version might copy settings instead; consider how best to
;; interface with customization mechanism so a new prover can be
;; configured by editing inside custom buffers.
;;
(require 'proof)

(defvar proof-easy-config-derived-modes-table
  '((""         "script" proof-mode (proof-config-done))
    ("shell"    "shell"  proof-shell-mode (proof-shell-config-done))
    ("response" "resp"   proof-response-mode (proof-response-config-done))
    ("goals"	"goals"   pbp-mode (proof-goals-config-done)))
  "A list of (PREFIXSYM SUFFIXNAME PARENT MODEBODY) for derived modes.")

(defun proof-easy-config-define-derived-modes ()
  (dolist (modedef proof-easy-config-derived-modes-table)
    (let* ((prefixsym (nth 0 modedef))
	   (suffixnm  (nth 1 modedef))
	   (parent    (nth 2 modedef))
	   (body      (nthcdr 3 modedef))
	   (modert    (concat (symbol-name proof-assistant-symbol)
			      "-" prefixsym))
	   (hyphen    (if (string-equal prefixsym "") "" "-"))
	   (mode      (intern (concat modert hyphen "mode")))
	   (modename  (concat proof-assistant " " suffixnm))
	   (varname   (intern (concat "proof-mode-for-" suffixnm))))
      (eval
       `(define-derived-mode ,mode ,parent ,modename nil ,@body))
      ;; Set proof-mode-for-script and friends
      ;; NB: top-level, so we don't need proof-pre-shell-start-hook.
      (set varname mode))))

(defun proof-easy-config-check-setup (sym name)
  "A number of simple checks."
  (cond
   ((or 
     (and (boundp 'proof-assistant) proof-assistant 
	  (not (equal proof-assistant ""))
	  (not (equal proof-assistant name)))
     (and (boundp 'proof-assistant-symbol) proof-assistant-symbol
	  (not (eq proof-assistant-symbol sym))))
    (error "proof-easy-config: Proof General is already in use for a different prover!"))
   (t
    ;; Setting these here is nice for testing: no need to get
    ;; proof-assistants-table right first.
    (customize-set-variable 'proof-assistant name)
    (customize-set-variable 'proof-assistant-symbol sym))))

(defmacro proof-easy-config (sym name &rest body)
  "Configure Proof General for proof-assistant using BODY as a setq body."
  `(progn
     (proof-easy-config-check-setup ,sym ,name)
     (setq
      ,@body)
     (proof-easy-config-define-derived-modes)
     ;; FIXME: Non-uniformity in current code
     (setq proof-mode-for-goals proof-mode-for-pbp)))
  
;; 
(provide 'proof-easy-config)

