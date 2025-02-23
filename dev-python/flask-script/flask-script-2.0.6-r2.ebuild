# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

MY_PN="Flask-Script"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Flask support for writing external scripts"
HOMEPAGE="https://flask-script.readthedocs.io/en/latest/
	https://github.com/smurfix/flask-script
	https://pypi.org/project/Flask-Script/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="python2"
KEYWORDS="amd64 x86"
IUSE="doc test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/flask-0.10.1-r1:python2[${PYTHON_USEDEP}]
	!<dev-python/flask-script-2.0.6-r2[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_P}"

PATCHES=( "${FILESDIR}/${P}-flask_script-everywhere.patch" )

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	py.test tests.py || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	distutils-r1_python_install_all
}
