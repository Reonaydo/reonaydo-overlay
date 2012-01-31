# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit qt4-r2 git-2

DESCRIPTION="Lightweight and cross-platform clipboard history applet"
HOMEPAGE="http://code.google.com/p/qlipper/"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/qlipper/qlipper.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	x11-libs/qt-gui:4
	x11-libs/qt-svg:4"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake4 INSTALL_PREFIX=/usr
}
