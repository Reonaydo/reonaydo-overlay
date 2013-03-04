# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit cmake-utils git-2

DESCRIPTION="lightweight & open source microblogging client"
HOMEPAGE="http://hotot.org"
SRC_URI=""
EGIT_REPO_URI="git://github.com/lyricat/Hotot.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="kde qt4 gtk gtk3"

REQUIRED_USE="^^ ( qt4 gtk )"

RDEPEND="
	qt4? ( >dev-qt/qtcore-4.7 dev-qt/qtwebkit dev-qt/qtsql dev-qt/qtgui )
	kde? ( kde-base/kdelibs:4 )
	gtk? (
		>=dev-python/pywebkitgtk-1.1.8 dev-python/notify-python
		dev-python/python-distutils-extra dev-libs/keybinder[python]
	)"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use qt4 WITH_QT)
		$(cmake-utils_use kde WITH_KDE)
		$(cmake-utils_use gtk WITH_GTK)
		$(cmake-utils_use gtk3 WITH_GIR)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	mv ${D}/usr/share/applications/hotot-qt.desktop ${D}/usr/share/applications/hotot.desktop || die
	ln ${D}/usr/bin/hotot-qt ${D}/usr/bin/hotot || die
}
