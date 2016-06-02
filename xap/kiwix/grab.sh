#!/bin/bash
pkgname=kiwix
giturl="https://github.com/kiwix/kiwix"

# set pkgver to current date
pkgver=$(date +%Y%m%d)
if [ -d $pkgname ]; then
	(
	cd $pkgname
	git pull --depth 1
	)
else
	git clone --depth 1 $giturl
fi
 
# create the source archive
tar czf $pkgname-$pkgver.src.tar.gz $pkgname
 
# change the SLKBUILD
sed -i 's#^pkgver=.*#pkgver='$pkgver'#' SLKBUILD
