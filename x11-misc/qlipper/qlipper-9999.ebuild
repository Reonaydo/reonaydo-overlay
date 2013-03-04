# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

DESCRIPTION="Lightweight and cross-platform clipboard history applet"
HOMEPAGE="http://code.google.com/p/qlipper/"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/qlipper/qlipper.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE=""

DEPEND="
	dev-qt/qtgui:4
	dev-qt/qtsvg:4"
RDEPEND="${DEPEND}"
