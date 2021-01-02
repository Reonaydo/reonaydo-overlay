# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

MY_PN="GoldenCheetah"
MY_PV=$(ver_rs 2 '-DEV')
MY_P="${MY_PN}-${MY_PV}"


DESCRIPTION="Cycling performance software"
HOMEPAGE="http://www.goldencheetah.org/"
SRC_URI="https://github.com/GoldenCheetah/${MY_PN}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtopengl:5
	dev-qt/qtconcurrent:5
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtprintsupport:5
	dev-qt/qtscript:5
	dev-qt/qtserialport:5
	dev-qt/qtsvg:5
	dev-qt/qttranslations:5
	dev-qt/qtbluetooth:5
	dev-qt/qtpositioning:5
	dev-qt/qtcharts:5
	sci-libs/gsl"
#	dev-libs/libusb-compat
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/3628.patch )

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	eapply_user

	#eapply "${FILESDIR}"/${P}-flex-fix.patch
	#eapply "${FILESDIR}"/${P}-make_pair-fix.patch

	sed -e "s:#QMAKE_LRELEASE:QMAKE_LRELEASE:" src/gcconfig.pri.in > src/gcconfig.pri || die
	sed -i "s:#CONFIG += release:CONFIG += release:"                src/gcconfig.pri || die

	# add in libz support, needed because something something QT on Gentoo
	sed -i "s:#LIBZ_INCLUDE.*:LIBZ_INCLUDE = yes:"                  src/gcconfig.pri || die
	sed -i "s:#LIBZ_LIBS.*:LIBZ_LIBS = -lz:"                        src/gcconfig.pri || die

	# # add in libusb support, for ANT+ usb dongles
	# # requires libusb-compat 
	# sed -i "s:#LIBUSB_INSTALL.*:LIBUSB_INSTALL = yes:"              src/gcconfig.pri || die
	# sed -i "s:#LIBUSB_INCLUDE.*:LIBUSB_INCLUDE = /usr/include:"     src/gcconfig.pri || die
	# sed -i "s:#LIBUSB_LIBS.*:LIBUSB_LIBS = -lusb:"                  src/gcconfig.pri || die

	# gsl
	sed -i "s:#GSL_INCLUDES.*:GSL_INCLUDES = /usr/include:"         src/gcconfig.pri || die
	sed -i "s:#GSL_LIBS.*:GSL_LIBS = -lgsl -lgslcblas -lm:"         src/gcconfig.pri || die


	# add in VLC support
	sed -i "s:#VLC_INSTALL.*:VLC_INSTALL = yes:"                    src/gcconfig.pri || die
	sed -i "s:#VLC_INCLUDE.*:VLC_INCLUDE = /usr/include:"           src/gcconfig.pri || die
	sed -i "s:#VLC_LIBS.*:VLC_LIBS = -lvlc -lvlccore:"              src/gcconfig.pri || die


	sed -i "s:DEFINES += GC_VIDEO_NONE:#DEFINES += GC_VIDEO_NONE:"  src/gcconfig.pri || die
	sed -i "s:#DEFINES += GC_VIDEO_VLC:DEFINES += GC_VIDEO_VLC:"    src/gcconfig.pri || die

	sed -e "s:/usr/local/:/usr/:" qwt/qwtconfig.pri.in > qwt/qwtconfig.pri || die
}

src_configure() {
	eqmake5 -recursive
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install

	dobin "src/GoldenCheetah"
}
