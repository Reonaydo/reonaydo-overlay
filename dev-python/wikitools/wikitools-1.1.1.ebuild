# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
RESTRICT_PYTHON_ABIS="3.*"
inherit distutils

DESCRIPTION="Python package to interact with the MediaWiki API"
HOMEPAGE="https://code.google.com/p/python-wikitools/"
SRC_URI="https://python-${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="|| ( ( >=dev-lang/python-2.5 dev-python/simplejson )
	>=dev-lang/python-2.6 )
	dev-python/poster"