# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="Core Library for Google Client Libraries"
HOMEPAGE="https://github.com/googleapis/python-api-core
	https://googleapis.dev/python/google-api-core/latest"
SRC_URI="https://github.com/googleapis/${PN//google/python}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P//google/python}"

LICENSE="Apache-2.0"
SLOT="python2"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/namespace-google[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
	dev-python/googleapis-common-protos[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	!<dev-python/google-api-core-1.17.0-r3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/grpcio[${PYTHON_USEDEP}]
	)
"

python_test() {
	distutils_install_for_testing
	pytest -vv || die "tests fail with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
