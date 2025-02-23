# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic qmake-utils

DESCRIPTION="G'MIC GUI for video streams"
HOMEPAGE="https://github.com/c-koi/zart"
ZART_COMMIT="939cf381c5871e506aabd066037acf2b55143c1d"
SRC_URI="https://github.com/c-koi/zart/archive/${ZART_COMMIT}.zip -> ${P}.zip"

LICENSE="CeCILL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtxml:5
	media-gfx/gmic[fftw,opencv,openmp]
	>=media-libs/opencv-4
	sci-libs/fftw:3.0[threads]
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	media-libs/cimg
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.2.2-dynamic-linking-r2.patch
)

S="${WORKDIR}/${PN}-${ZART_COMMIT}"

pkg_pretend() {
	tc-has-openmp || die "Please switch to an openmp compatible compiler"

	if ! test-flag-CXX -std=c++11 ; then
		die "You need at least GCC 4.7.x or Clang >= 3.3 for C++11-specific compiler flags"
	fi
}

src_configure() {
	eqmake5 GMIC_DYNAMIC_LINKING=on zart.pro
}

src_install() {
	dobin "zart"
}
