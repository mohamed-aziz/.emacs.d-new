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

(setq emms-browser-covers 'my-emms-covers)

(defun my-emms-covers (dir type)
  "Choose album cover in DIR deppending on TYPE.
Small cover should be less than 80000 bytes.
Medium - less than 120000 bytes."
  (let* ((pics (directory-files-and-attributes
		dir t "\\.\\(jpe?g\\|png\\|gif\\|bmp\\)$" t))
	 (pic (car pics))
	 (pic-size (nth 8 pic)))
    (let (temp)
      (cond
       ((eq type 'small)
	(while (setq temp (cadr pics))
	  (let ((temp-size (nth 8 temp)))
	    (if (< temp-size pic-size)
		(setq pic temp
		      pic-size temp-size)))
	  (setq pics (cdr pics)))
	(if (<= (or pic-size 80001) 80000)
	    (car pic)))
       ((eq type 'medium)
	(if (and pic (setq temp (cadr pics)))
	    (progn
	      (setq pics (cdr pics))
	      (let ((temp-size (nth 8 temp)))
		(let ((small temp)
		      (small-size temp-size))
		  (if (< pic-size small-size)
		      (setq small pic
			    small-size pic-size
			    pic temp
			    pic-size temp-size))
		  (while (setq temp (cadr pics))
		    (setq temp-size (nth 8 temp))
		    (cond
		     ((< temp-size small-size)
		      (setq pic small
			    pic-size small-size
			    small temp
			    small-size temp-size))
		     ((< temp-size pic-size)
		      (setq pic temp
			    pic-size temp-size)))
		    (setq pics (cdr pics)))
		  (car (if (<= pic-size 120000) pic
			 small)))))
	  (car pic)))
       ((eq type 'large)
	(while (setq temp (cadr pics))
	  (let ((temp-size (nth 8 temp)))
	    (if (> temp-size pic-size)
		(setq pic temp
		      pic-size temp-size)))
	  (setq pics (cdr pics)))
	(car pic))))))

(provide 'music)
