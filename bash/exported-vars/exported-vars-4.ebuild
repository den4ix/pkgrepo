EAPI=4

DESCRIPTION="Output lists of global and phase scope variables"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}

GLOBAL_VARS=$(compgen -v)
PHASES=( src_prepare src_configure src_compile src_test src_install )

for phase in "${PHASES[@]}"; do
	eval "${phase}() {
		compgen -v > \"\${S}\"/\${FUNCNAME[0]}-vars
		echo \${GLOBAL_VARS} | tr ' ' '\n' > \"\${S}\"/global-vars
	}"
done