# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Extension to sphinx to include program output"
HOMEPAGE="https://sphinxcontrib-programoutput.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="python2"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

IUSE="doc test"

RDEPEND="dev-python/sphinx:python2[${PYTHON_USEDEP}]
	dev-python/namespace-sphinxcontrib:python2[${PYTHON_USEDEP}]
	!<dev-python/sphinxcontrib-programoutput-0.11-r200[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_compile_all() {
	if use doc; then
		python_setup
		esetup.py build_sphinx
		HTML_DOCS=( "${BUILD_DIR}/sphinx/html/." )
	fi
}

python_test() {
	esetup.py pytest || die
}

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
