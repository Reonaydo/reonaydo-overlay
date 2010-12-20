# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

if [[ ${PV} == "9999" ]]; then
	ESVN_REPO_URI="http://tint2.googlecode.com/svn/trunk/"
	inherit subversion
else
	SRC_URI="http://tint2.googlecode.com/files/${P}.tar.gz"
fi


DESCRIPTION="Tint2 is a lightweight taskbar originally based on TTM"
HOMEPAGE="http://code.google.com/p/tint2/"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/cairo
	x11-libs/pango
	=dev-libs/glib-2*
	media-libs/imlib2
	x11-libs/libXinerama
	x11-libs/libX11
	!x11-misc/tint"
DEPEND="dev-util/pkgconfig ${RDEPEND}"

S=${WORKDIR}/${PN}

src_unpack()
{
	if [[ ${PV} == "9999" ]]; then
		subversion_src_unpack
	else
		unpack ${A}
	fi

	cd "${S}/src"
	sed -i -e "s/^.*strip.*$/install:/" Makefile || die "sed failed in Makefile"
}

src_compile()
{
	cd "${S}/src"
	rm tint2
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"  || die "emake failed"
}

src_install()
{
	cd "${S}/src"
	emake DESTDIR="${D}" install || die "emake install failed"
	cd "${S}"
	dodoc README ChangeLog || die "dodoc readme changelog failed"
	dodoc tintrc* || die "dodoc tintrc failed"
	dodoc doc/* || die "dodoc pdf odt failed"
}

pkg_postinst()
{
	elog
	elog "Start tint2 with \"${PN}\""
	elog
	elog "The default configuration file is /etc/xdg/tint2/tintrc"
	elog "\"${PN}\" creates a config file in \$HOME/.config/tint2/tintrc"
	elog "More documentation is available in /usr/share/doc/${PF}"
}
