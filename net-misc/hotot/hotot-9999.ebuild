# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit cmake-utils git-2 python

DESCRIPTION="lightweight & open source microblogging client"
HOMEPAGE="http://hotot.org"
SRC_URI=""
EGIT_REPO_URI="git://github.com/shellex/Hotot.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="kde qt4 gtk"

REQUIRED_USE="^^ ( qt4 gtk )"

RDEPEND="
	qt4? ( x11-libs/qt-core x11-libs/qt-webkit x11-libs/qt-sql x11-libs/qt-gui )
	kde? ( kde-base/kdelibs:4 )
	gtk? (
		>=dev-python/pywebkitgtk-1.1.8 dev-python/notify-python
		dev-python/python-distutils-extra dev-libs/keybinder[python]
	)"
DEPEND="${RDEPEND}"

src_prepare() {
	if use qt4; then
		sed 's/hotot-qt/hotot/g' -i CMakeLists.txt|| die
		sed 's/hotot-qt/hotot/g' -i qt/src/mainwindow.cpp || die
		sed 's/hotot-qt/hotot/g' -i qt/src/CMakeLists.txt || die
		sed 's/hotot-qt/hotot/g' -i qt/src/qttraybackend.cpp || die
		sed 's/hotot-qt/hotot/g' -i qt/src/main.cpp || die
		sed 's/hotot-qt/hotot/g' -i qt/data/CMakeLists.txt || die
		sed 's/hotot-qt/hotot/g' -i qt/data/hotot-qt.desktop || die
		sed 's/hotot-qt/hotot/g' -i qt/po/CMakeLists.txt || die
		sed 's/hotot-qt/hotot/g' -i qt/po/Messages.sh || die
		mv qt/data/hotot-qt.desktop qt/data/hotot.desktop || die
		mv qt/po/hotot-qt.pot qt/po/hotot.pot || die
	else
		python_src_prepare
	fi
}

src_configure() {
	if use qt4; then
		local mycmakeargs=(
			$(cmake-utils_use_want kde WITH_KDE)
		)
		cmake-utils_src_configure
	else
		python_src_configure
	fi
}

src_compile() {
	if use qt4; then
		cmake-utils_src_compile
	else
		python_src_compile
	fi
}

src_install() {
	if use qt4; then
		cmake-utils_src_install
	else
		python_src_install
	fi
}
