# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{8..10} )

inherit python-r1

DESCRIPTION="A virtual for the Python cffi package"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~x64-solaris"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# built-in in PyPy and PyPy3
RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/cffi:python2[${PYTHON_USEDEP}]' -2)
	$(python_gen_cond_dep 'dev-python/cffi:0[${PYTHON_USEDEP}]' -3)
"
