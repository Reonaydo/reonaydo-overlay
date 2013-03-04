# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
inherit distutils

DESCRIPTION="Make HTTP POST/PUT with multipart/form-data encoding"
HOMEPAGE="http://atlee.ca/software/poster/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	http://atlee.ca/software/poster/dist/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
