# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1 xdg-utils

MYPV=${PV/_/}
S=${WORKDIR}/${PN}-${MYPV}

DESCRIPTION="Helpers for Astropy and Affiliated packages"
HOMEPAGE="https://github.com/astropy/astropy-helpers"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MYPV}.tar.gz"

LICENSE="BSD"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

python_prepare_all() {
	sed -e '/import ah_bootstrap/d' \
		-i setup.py || die "Removing ah_bootstrap failed"
	xdg_environment_reset
	distutils-r1_python_prepare_all
}
