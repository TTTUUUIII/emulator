#!/bin/bash

. "$(dirname $(readlink -f $0))/data-mapping.sh"

WEB_ROOT=/var/www/emulator.snowland.ink
SOURCE=/var/www/media.snowland.ink

function pr_error() {
	echo -e "\e[31m$1\e[0m"
}

function pr_warn() {
	echo -e "\e[33m$1\e[0m"
}

function create_link() {
	local rel=""
	shopt -s nocasematch
	for ((i = 0; i < ${#LN_ARRAY[@]}; ++i)); do
		local index=$(expr index "${LN_ARRAY[i]}" "^")
		if [ $index -ne 0 ]; then
			rel=${LN_ARRAY[i]:1}
			continue
		fi
		if [[ "${LN_ARRAY[i]}" == \~* ]]; then
			local from=${LN_ARRAY[i]:1}
			local to=$from
			if [[ $from =~ \.jpg|\.jpeg|\.png|\.webp|\.bmp|\.gif|\.svg ]]; then
				to="images/$from"
			fi
		else
			local from=${LN_ARRAY[i]}
			local to=${LN_ARRAY[((++i))]}
		fi
		if [ ! -L "$WEB_ROOT/data/$to" ] && [ ! -f "$WEB_ROOT/data/$to" ]; then
			if ! ln -s "$SOURCE/$rel$from" "$WEB_ROOT/data/$to"; then
				return 1
			else
				echo "New Link $WEB_ROOT/data/$to"
			fi
		fi
	done
	shopt -u nocasematch
	return 0
}

function update_datamap() {
	if [ ! -x "tools/jq" ]; then
		chmod +x tools/jq
	fi
	tools/jq --compact-output . data/datamap.json >$WEB_ROOT/data/datamap.json
}

function update_sitemap() {
	python tools/generate-sitemap.py $WEB_ROOT
}

function update_assets() {
	cp index.html $WEB_ROOT/ &&
		cp assets/css/* $WEB_ROOT/assets/css/ &&
		cp assets/img/* $WEB_ROOT/assets/img/ &&
		java -jar tools/closure-compiler.jar \
			--js assets/js/functions.js \
			--js assets/js/properties.js \
			--js assets/js/datamap.js \
			--js assets/js/ui.js \
			--js assets/js/toast.js \
			--js assets/js/emulator.js \
			--js assets/js/main.js \
			--js_output_file $WEB_ROOT/assets/js/main.min.js
}

function copy_bios() {
	cp -r data/bios $WEB_ROOT/data/
}

function help() {
	echo """
update.sh by wn123o.
Usage: update.sh [action...]
Actions:
    slink			Create file soft link.
    assets			Update web assets. css, js, img
    sitemap			Gnenerate sitemap.
    datamap			Update data map.
	copy-bios		Copy bios.
"""
}

while (("$#" > 0)); do
	case "$1" in
	slink)
		create_link
		;;
	assets)
		update_assets
		;;
	sitemap)
		update_sitemap
		;;
	datamap)
		update_datamap
		;;
	copy-bios)
		copy_bios
		;;
	*)
		pr_error "Unkown action \"$1\"!"
		exit 1
		;;
	esac
	if [ "$?" -ne 0 ]; then
		pr_error "Action \"$1\" execution failed!"
		exit 1
	fi
	shift
done
