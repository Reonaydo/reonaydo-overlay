# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

LANGS="ru"

inherit cmake-utils git-r3

MY_PN="${PN/vacuum-/}"
DESCRIPTION="DBus popup notifications for vacuum"
HOMEPAGE="https://github.com/Vacuum-IM/dbusnotifications"
EGIT_REPO_URI="https://github.com/Vacuum-IM/${MY_PN}/"
EGIT_SUBMODULES=( cmake )

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
for x in ${LANGS}; do
	IUSE+=" linguas_${x}"
done

RDEPEND="
	>=net-im/vacuum-1.3.0:=
	>=dev-qt/qtgui-4.5:4[dbus(+)]
"
DEPEND="${RDEPEND}"

src_configure() {
	# linguas
	local langs="none;"
	for x in ${LANGS}; do
		use linguas_${x} && langs+="${x};"
	done

	local mycmakeargs=(
		-DINSTALL_LIB_DIR="$(get_libdir)"
		-DLANGS="${langs}"
	)
	cmake-utils_src_configure
}
