# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 )

inherit twisted-r1

DESCRIPTION="A Twisted DNS implementation"

KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="
	=dev-python/twisted-core-${TWISTED_RELEASE}*[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}
	!dev-python/twisted
"
