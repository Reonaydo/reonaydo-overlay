# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit cmake-utils

DESCRIPTION="Mozilla KDE Integration"
HOMEPAGE="http://en.opensuse.org/KDE/FirefoxIntegration"
#SRC_URI="http://aur.archlinux.org/packages/kmozillahelper/kmozillahelper/${PN}-${PV}.tar.bz2"
SRC_URI="https://api.opensuse.org/public/source/mozilla:Factory/mozilla-kde4-integration/${PN}-${PV}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=kde-base/kdelibs-4.2"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}
