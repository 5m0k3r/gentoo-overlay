# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1
MY_PN=zope.component
MY_P=${MY_PN}-${PV}

DESCRIPTION="Zope Component Architecture"
HOMEPAGE="https://github.com/zopefoundation/zope.component
	https://docs.zope.org/zope.component/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="ZPL"
SLOT="python2"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 x86"
IUSE="test"

RDEPEND="dev-python/namespace-zope:python2[${PYTHON_USEDEP}]
	dev-python/zope-event:python2[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-4.1.0:python2[${PYTHON_USEDEP}]
	!<dev-python/zope-component-4.4.1-r200[${PYTHON_USEDEP}]
"
DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}

RESTRICT="test"

python_test() {
	nosetests || die
}

python_install_all() {
	distutils-r1_python_install_all

	# remove .pth files since dev-python/namespace-zope handles the ns
	find "${D}" -name '*.pth' -delete || die
}
