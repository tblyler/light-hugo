#!/bin/bash

if [ "${1}" = "clean" ]; then
	echo 'Pruning static/css'
	rm -R ./static/css/*
	exit $?
fi

if ! which sass &> /dev/null; then
	echo 'sass is missing from PATH' 1>&2
	exit 1
fi

if ! which awk &> /dev/null; then
	echo 'awk is missing from PATH' 1>&2
	exit 1
fi

SASS_VERSION=$(sass --version | awk '{ print $2}' | tr '.' ' ')
SASS_MAJOR=$(echo "${SASS_VERSION}" | awk '{ print $1 }')
SASS_MINOR=$(echo "${SASS_VERSION}" | awk '{ print $2 }')

if [ ${SASS_MAJOR} -lt 3 ] || ([ ${SASS_MAJOR} -eq 3 ] && [ ${SASS_MINOR} -lt 4 ]); then
	echo 'sass version must be >= 3.4' 1>&2
	echo "version ${SASS_VERSION} installed" 1>&2
	exit 1
fi

if [ "${1}" = "watch" ]; then
	sass --sourcemap=none --watch ./scss:./static/css
	exit $?
fi

echo 'Compiling sass'
sass --sourcemap=none --style compressed --update ./scss:./static/css

RETURN=$?

if [ $RETURN -ne 0 ]; then
	echo 'Failure' 1>&2
	exit $RETURN
fi

echo 'Success'
