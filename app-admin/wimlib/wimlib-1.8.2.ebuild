# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="wimlib is a C library to read, write, and mount archive files in the Windows Imaging Format (WIM files)."
HOMEPAGE="http://wimlib.net/"
SRC_URI="http://wimlib.net/downloads/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="iso"

DEPEND="
	sys-fs/ntfs3g
	dev-libs/openssl
	sys-fs/fuse
	dev-libs/libxml2
	sys-apps/attr
	iso? ( 
		sys-fs/mtools
		sys-boot/syslinux
		app-arch/cabextract
		|| ( app-cdr/cdrkit app-cdr/cdrtools )
	)
	"
RDEPEND="${DEPEND}"

