# -*- coding: utf-8-unix; mode: makefile-gmake; -*-

PREFIX=/usr/local

usage: 
	echo sudo time make .make.install-git

update-git-core:
	sudo yum -y update git-core
	yum info git-core

remove-git:
	echo need sudo
	time yum -y remove git; echo ES $$?

.make.pre-git-package:
	echo need sudo
	time yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker gcc; echo ES $$?
	date > .make.pre-git-package

.make.download-git:
	wget https://www.kernel.org/pub/software/scm/git/git-2.2.1.tar.gz
	ls -l
	date > .make.download-git

.make.unpack-git: .make.download-git
	tar zxvf git-2.2.1.tar.gz
	ls -l
	date > .make.unpack-git

.make.install-git: .make.pre-git-package .make.unpack-git
	( cd git-2.2.1 && ./configure --prefix=${PREFIX} && make prefix=${PREFIX} all && make prefix=${PREFIX} install ; echo ES $? )
	git --version
	which git
	ls -l ${PREFIX}/bin/git
	echo add ${PREFIX}/bin to your PATH
	date > .make.install-git

clean:
	rm -f .make.pre-git-package .make.download-git .make.unpack-git .make.install-git
