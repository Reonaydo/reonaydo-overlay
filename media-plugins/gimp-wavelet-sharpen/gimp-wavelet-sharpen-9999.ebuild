# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils base

DESCRIPTION="GIMP plug-in for losslessly decomposes a layer of an image into layers of wavelet scales"
HOMEPAGE="http://registry.gimp.org/node/11742"
if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mrossini-ethz/gimp-wavelet-sharpen.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://registry.gimp.org/files/wavelet-sharpen-${PV}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND=">=media-gfx/gimp-2.4.0"
DEPEND="${RDEPEND}"

PATCHES=(
    "${FILESDIR}"/makefile9999.patch
)

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe src/wavelet-sharpen
##
	emake LOCALEDIR="${D}/usr/share/locale" -C po install
#	einstall LOCALEDIR="$D"/usr/share/locale -C po
}
