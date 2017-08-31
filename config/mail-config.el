(require 'mu4e)
(require 'mu4e-multi)

;; default
(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq mu4e-drafts-folder "/[Gmail].Brouillons")
(setq mu4e-sent-folder   "/[Gmail].Messages envoy&AOk-s")
(setq mu4e-trash-folder  "/[Gmail].Corbeille")

(defvar my/mu4e-account-alist
  '(("GMAIL"
     (mu4e-drafts-folder  "/[Gmail].Brouillons")
     (mu4e-sent-folder   "/[Gmail].Messages envoy&AOk-s")
     (mu4e-trash-folder  "/[Gmail].Corbeille")
     (user-mail-address  "medazizknani@gmail.com")
     (user-full-name  "Mohamed Aziz Knani")
     (smtpmail-default-smtp-server  "smtp.gmail.com")
     (smtpmail-smtp-server  "smtp.gmail.com")
     (smtpmail-smtp-service  587)
     (smtpmail-starttls-credentials  '(("smtp.gmail.com" 587 nil nil)))
     (message-signature  (concat "Mohamed Aziz Knani\n" "http://www.aziz.tn/\n")))
    ("COCK"
     (mu4e-sent-folder  "/Cock/SENT")
     (mu4e-trash-folder  "/Cock/Trash")
     (mu4e-drafts-folder  "/Cock/Drafts")
     (user-mail-address  "mak@cock.li")
     (smtpmail-default-smtp-server  "mail.cock.li")
     (smtpmail-smtp-server  "mail.cock.li")
     (user-full-name   "mak")
     (message-signature  (concat "mak.\n" "http://www.aziz.tn/\n"))
     (smtpmail-smtp-service  587)
     (smtpmail-starttls-credentials '(("mail.cock.li" 587 nil nil))))))

(setq mu4e-user-mail-address-list
      (mapcar (lambda (account) (cadr (assq 'user-mail-address account)))
              my/mu4e-account-alist))

(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Messages envoy&AOk-s" . ?s)
        ("/[Gmail].Corbeille"     . ?t)
	("/Cock/INBOX" . ?c)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap -a MAKCock,Gmail")


;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
      smtpmail-debug-info t)



(provide 'mail-config)
