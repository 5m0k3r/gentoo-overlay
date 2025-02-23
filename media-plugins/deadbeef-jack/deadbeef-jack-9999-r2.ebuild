# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

DESCRIPTION="JACK output plugin for DeaDBeeF."
HOMEPAGE="https://github.com/DeaDBeeF-Player/jack"
EGIT_REPO_URI="https://github.com/DeaDBeeF-Player/jack.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND_COMMON="
	media-sound/deadbeef
	virtual/jack"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"

src_install(){
	insinto /usr/$(get_libdir)/deadbeef
	doins jack.so
}
