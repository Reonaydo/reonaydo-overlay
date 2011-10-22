# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit versionator cmake-utils mercurial

DESCRIPTION="THe Experimental RAw Photo Editor"
HOMEPAGE="http://www.rawtherapee.com/"
EHG_REPO_URI="https://rawtherapee.googlecode.com/hg/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
LANGS="cs da de en_US en_GB el es eu fr he hu it ja lv nl nn pl ru sk fi sv tr zh_CN zh_TW"
for lng in ${LANGS}; do
	IUSE="${IUSE} linguas_${lng}"
done

RDEPEND="dev-cpp/gtkmm:2.4
	media-libs/jpeg
	media-libs/tiff
	media-libs/libpng
	media-libs/libiptcdata
	media-libs/lcms"

RESTRICT="strip"

S=${WORKDIR}/hg
