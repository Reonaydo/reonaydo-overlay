# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/requests/requests-1.2.3.ebuild,v 1.3 2013/09/05 18:46:21 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="GRequests allows you to use Requests with Gevent to make asyncronous HTTP Requests easily."
HOMEPAGE="http://pypi.python.org/pypi/grequests https://crate.io/packages/grequests/ https://github.com/kennethreitz/grequests"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86"
IUSE="test"

# bundles dev-python/urllib3 snapshot
RDEPEND="dev-python/gevent
	dev-python/requests"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

# tests connect to various remote sites
RESTRICT="test"

DOCS=( README.rst )

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}
