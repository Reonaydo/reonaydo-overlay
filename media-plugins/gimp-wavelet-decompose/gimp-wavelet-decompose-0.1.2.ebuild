# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils base

DESCRIPTION="GIMP plug-in for losslessly decomposes a layer of an image into layers of wavelet scales"
HOMEPAGE="http://registry.gimp.org/node/11742"
SRC_URI="http://registry.gimp.org/files/wavelet-decompose-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND=">=media-gfx/gimp-2.4.0"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/wavelet-decompose-makefile.patch
)

S=${WORKDIR}/wavelet-decompose-${PV}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe src/wavelet-decompose
#
#	emake LOCALEDIR="${D}/usr/share/locale" -C po install
	einstall LOCALEDIR="$D"/usr/share/locale -C po
}
