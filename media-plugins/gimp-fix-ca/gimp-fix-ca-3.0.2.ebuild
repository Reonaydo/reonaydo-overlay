# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils base

DESCRIPTION="GIMP plug-in to correct chromatic aberration"
HOMEPAGE="http://kcd.sourceforge.net/fix-ca.php"
SRC_URI="http://kcd.sourceforge.net/fix-ca.c"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=">=media-gfx/gimp-2.4.0"
DEPEND="${RDEPEND}"

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/fix-ca.c ${S}
}

src_compile() {
	gimptool-2.0 --build fix-ca.c
}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe fix-ca
}
