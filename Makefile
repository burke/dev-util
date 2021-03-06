# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

all: devserver

devserver:
	@echo "Preparing devserver modules."

install:
	mkdir -p "${DESTDIR}/usr/bin"
	mkdir -p "${DESTDIR}/usr/lib/devserver"
	mkdir -p "${DESTDIR}/usr/lib/installer"
	install -m 0755 host/start_devserver "${DESTDIR}/usr/bin"
	install -m 0755 devserver.py "${DESTDIR}/usr/lib/devserver"
	install -m 0755 chromeos-common.sh "${DESTDIR}/usr/lib/installer"
	install -m 0644  \
		autoupdate.py \
		autoupdate_lib.py \
		builder.py \
		common_util.py \
		constants.py \
		gsutil_util.py \
		log_util.py \
		strip_package.py \
		"${DESTDIR}/usr/lib/devserver"

	install -m 0755 stateful_update "${DESTDIR}/usr/bin"

	# Data directory for the devserver.
	mkdir -m0777 -p "${DESTDIR}/var/lib/devserver"
	mkdir -m0777 -p "${DESTDIR}/var/lib/devserver/static"
	mkdir -m0777 -p "${DESTDIR}/var/lib/devserver/static/cache"

.PHONY: all devserver install
