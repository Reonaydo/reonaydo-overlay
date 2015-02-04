# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/salt/salt-9999.ebuild,v 1.16 2015/01/16 22:56:46 chutzpah Exp $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION="Salt is a remote execution and configuration manager"
HOMEPAGE="http://saltstack.org/"

if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/saltstack/pepper.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND=""
DEPEND="	"

DOCS=(README.rst)



