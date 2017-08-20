(require 'emms-setup)
(emms-standard)
(emms-default-players)
(define-emms-simple-player mplayer '(file url)
  (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma" ".webm"
                ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls" ".opus"))
  "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")

(require 'emms-player-mpv)
(add-to-list 'emms-player-list 'emms-player-mpv)

(require 'emms-info-libtag)
(setq emms-info-functions '(emms-info-libtag))
;;; below is a nice key command for toggling the music browser
(autoload 'emms-smart-browse "emms-browser.el" "Browse with EMMS" t)

(global-set-key [(f7)] 'emms-smart-browse) 


(setq emms-source-file-default-directory "~/Music/")

(provide 'music)
