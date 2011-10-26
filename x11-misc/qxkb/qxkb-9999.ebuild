# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils subversion

DESCRIPTION="Qt4 application to adjust layouts by xkb"
HOMEPAGE="http://code.google.com/p/qxkb/"
ESVN_REPO_URI="http://qxkb.googlecode.com/svn/trunk/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="debug"

LANGS="ru"
for L in $LANGS; do
	IUSE="$IUSE linguas_$L"
done

DEPEND="x11-libs/libxkbfile
	x11-libs/qt-gui:4
	x11-libs/qt-svg:4"
RDEPEND="${DEPEND}"

#DOCS="NEWS"

#src_prepare() {
#	local langs=
#	local langsX=
#	for L in $LINGUAS; do
#		if has ${L} $LANGS; then
#			langs="${langs} language/qxkb_${L}.ts"
#			langsX="${langsX} language/qxkb_${L}.qm"
#		fi
#	done
#	sed -i -e "s:^\(TRANSLATIONS = \).*:\1 ${langs}:" QXKB.pro ||
#		die "sed failed"
#	sed -i -e "s:^\(translations.files += \).*:\1 ${langsX}:" QXKB.pro ||
#		die "sed failed"
#}
