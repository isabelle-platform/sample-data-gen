#!/bin/bash

TOP_DIR="$(cd "$(dirname "$(which "$0")")" ; pwd -P)"

out="$1"

if [ "$out" == "" ] ; then
	echo "Pass output folder"
	exit 1
fi

function create_collection() {
	local base="$1"
	local col="$2"
	local obj="$3"

	mkdir -p "${base}/collection/${col}"

	if [ "$obj" == "" ] ; then
		echo 0 > "${base}/collection/${col}/cnt"
	else
		echo 1 > "${base}/collection/${col}/cnt"
		mkdir -p "${base}/collection/${col}/1"
		cp "$obj" "${base}/collection/${col}/1/data.js"
	fi

	return 0
}

mkdir -p "$out"
cp "${TOP_DIR}/internals.js" "${out}/"

mkdir -p "${out}/collection"
create_collection "$out" job
create_collection "$out" mentee
create_collection "$out" payment
create_collection "$out" query
create_collection "$out" user "${TOP_DIR}/admin.js"
create_collection "$out" event
