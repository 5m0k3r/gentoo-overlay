# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5


DESCRIPTION="utility that takes a screenshot using the framebuffer device"
HOMEPAGE="https://code.google.com/p/fbcat/"
SRC_URI="https://bitbucket.org/jwilk/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc fbgrab"

RDEPEND=""
DEPEND="
	doc? ( dev-libs/libxslt ) \
	fbgrab? ( !media-gfx/fbgrab ) \
"


src_compile() {
	emake
	if use doc; then
		emake -C doc
	fi
}

src_install() {
	dobin fbcat
	if use fbgrab; then
		dobin fbgrab
	fi
	if use doc; then
		doman doc/fbcat.1
		if use fbgrab; then
			doman doc/fbgrab.1
		fi
	fi
}

