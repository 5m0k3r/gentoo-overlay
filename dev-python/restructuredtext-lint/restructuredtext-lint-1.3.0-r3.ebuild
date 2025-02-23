# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Checks PyPI validity of reStructuredText"
HOMEPAGE="https://pypi.org/project/restructuredtext_lint/"

MY_P="restructuredtext_lint"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_P}/${MY_P}-${PV}.tar.gz"
S="${WORKDIR}/${MY_P}-${PV}"

LICENSE="Unlicense"
SLOT="python2"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/docutils-0.11[${PYTHON_USEDEP}]
	<dev-python/docutils-1.0[${PYTHON_USEDEP}]
	!<dev-python/restructuredtext-lint-1.3.0-r3[${PYTHON_USEDEP}]
"

python_prepare_all() {
	sed -i \
		-e "s/'restructuredtext-lint = restructuredtext_lint.cli:main'/'restructuredtext-lint_py2 = restructuredtext_lint.cli:main'/" \
		-e "s/'rst-lint = restructuredtext_lint.cli:main'/'rst-lint_py2 = restructuredtext_lint.cli:main'/" \
		setup.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	 nosetests -v || die
}
