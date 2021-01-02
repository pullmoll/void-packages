if [ "$CROSS_BUILD" ]; then
	case "$XBPS_TARGET_MACHINE" in
		ppcle*) msg_warn "There is no qemu-ppcle-static available ...\n"
			exit 2
			;;
	esac
	export QEMU_LD_PREFIX=${XBPS_CROSS_BASE}
	if [[ $hostmakedepends != *"qemu-user-static"* ]]; then
		hostmakedepends+=" qemu-user-static"
	fi
fi

vtargetrun() {
	if [ "$CROSS_BUILD" ]; then
		"/usr/bin/qemu-${XBPS_TARGET_QEMU_MACHINE}-static" "$@"
	else
		"$@"
	fi
}
