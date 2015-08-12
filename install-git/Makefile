# -*- coding: utf-8-unix; mode: makefile-gmake; -*-

PREFIX=/usr/local

usage: 
	echo sudo time make .make.install-git
	echo sudo time make .make.subversion-perl

update-git-core:
	sudo yum -y update git-core
	yum info git-core

remove-git:
	echo need sudo
	time yum -y remove git; echo ES $$?

.make.pre-git-package:
	echo need sudo
	time yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker gcc
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

.make.subversion-perl: 
	echo need sudo
	time yum -y install subversion-perl
	date > .make.subversion-perl

.make.perl-Term-ReadKey:
	date > .make.perl-Term-ReadKey
	echo "see http://d.hatena.ne.jp/littlebuddha/20090527/1243410035, Please enter the URL of your CPAN mirror"
	cpan YAML
	perl -MYAML -e '' ; echo ES $?
	cpan Term::ReadKey
	perl -MTerm::ReadKey -e '' ; echo ES $?

clean:
	rm -f .make.*

