#!/bin/bash

. "$(dirname `readlink -f $0`)/data-mapping.sh"

WEB_ROOT=/var/www/emulator.snowland.ink
SOURCE=/var/www/media.snowland.ink

function pr_error() {
	echo -e "\e[31m$1\e[0m"
}

function pr_warn() {
	echo -e "\e[33m$1\e[0m"
}

function create_link() {
	for ((i = 0; i < ${#DATA_MAPPING[@]}; i += 5)); do
		rom=${DATA_MAPPING[((i))]}
		rom_to=${DATA_MAPPING[((i + 1))]}
		img=${DATA_MAPPING[((i + 2))]}
		img_to=${DATA_MAPPING[((i + 3))]}
		base=${DATA_MAPPING[((i + 4))]}
		if [ ! -L "$WEB_ROOT/data/$rom_to" ] && [ ! -f "$WEB_ROOT/data/$rom_to" ]; then
			ln -s "$SOURCE/$base$rom" "$WEB_ROOT/data/$rom_to" && echo "New ROM Link $WEB_ROOT/data/$rom_to"
		fi
		if [ ! -L "$WEB_ROOT/data/images/$img_to" ] && [ ! -f "$WEB_ROOT/data/images/$img_to" ]; then
			ln -s "$SOURCE/$base$img" "$WEB_ROOT/data/images/$img_to" && echo "NEW IMG Link $WEB_ROOT/data/images/$img_to"
		fi
	done
}

function update_datamap() {
	if [ ! -x "tools/jq" ]; then
		chmod +x tools/jq
	fi
	tools/jq --compact-output . data/datamap.json >$WEB_ROOT/data/datamap.json
	return $?
}

function update_web() {
	if [ ! -x "tools/jq" ]; then
		chmod +x tools/jq
	fi
	cp index.html $WEB_ROOT/ &&
		cp assets/css/* $WEB_ROOT/assets/css/ &&
		cp assets/img/* $WEB_ROOT/assets/img/ &&
		update_datamap &&
		java -jar tools/closure-compiler.jar \
			--js assets/js/functions.js \
			--js assets/js/datamap.js \
			--js assets/js/ui.js \
			--js assets/js/emulator.js \
			--js assets/js/main.js \
			--js_output_file $WEB_ROOT/assets/js/main.min.js
	return $?
}

function help() {
	echo """
update.sh by wn123o.
Usage: update.sh [option]
Options:
    --all               Update link 、datamap and web files.
    --create-link       Create game link.
    --web        Update datamap and web files.
    --datamap    Update datamap.
"""
}

cd ${GITDIR:-.} && git pull >/dev/null &&
	case $1 in
	--all)
		create_link
		update_web
		;;
	--datamap | --update-datamap)
		update_datamap
		;;
	--web | --update-web)
		update_web
		;;
	--mapping | --update-mapping)
		create_link
		;;
	--game | --update-game)
		create_link
		update_datamap
		;;
	--help)
		help
		;;
	*) ;;

	esac
