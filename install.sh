#!/bin/sh -e

mkdir -p ~/.emacs.d/site-lisp/cedet/
mkdir -p ~/.emacs.d/site-lisp/ecb/

(cd cedet; find . | xargs touch;  make clean-all; make)

cp -r cedet/* ~/.emacs.d/site-lisp/cedet/

(cd ecb; make CEDET=~/.emacs.d/site-lisp/cedet/)
cp -r ecb/*	~/.emacs.d/site-lisp/ecb/

mkdir -p ~/.emacs.d/site-lisp/auto-complete/
(cd auto-complete; make; make install DIR=~/.emacs.d/site-lisp/auto-complete/)
#cp -ra auto-complete	~/emacs.d/site-lisp/auto-complete

cp xcscope/xcscope.el* ~/.emacs.d/site-lisp/
sudo cp xcscope/cscope-indexer /usr/bin/cscope-indexer

cp fic-mode.el ~/.emacs.d/site-lisp/