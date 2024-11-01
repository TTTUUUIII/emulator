#!/bin/bash

WEB_ROOT=/var/www/emulator.snowland.ink
SOURCE=/var/www/media.snowland.ink
DATA_MAPPING=(
	# NES
	# KONAMI
	Circus_Charlie_JP.nes
	Circus_Charlie_JP.nes
	CircusCharlieFlyer.jpg
	Circus_CharlieFlyer.jpg
	nes/konami/Circus_Charlie/

	Salamander_JP.nes
	Salamander_JP.nes
	Salamander_NES_large.jpg
	Salamander_NES.jpg
	nes/konami/salamander/

	Contra_JP.nes
	Contra_JP.nes
	Contra_Logo_01.png
	Contra_Logo_01.png
	nes/konami/contra/

	Super_Contra_JP.nes
	Super_Contra_JP.nes
	Super_Contra_\(arcade\)_-_01.png
	Super_Contra_\(arcade\)_-_01.png
	nes/konami/Super_Contra/

	Rush_\'n_Attack_US.nes
	Rush_\'n_Attack_US.nes
	Rush\'n_Attack_\(Flyer\)_Large.png
	Rush_\'n_Attack_\(Flyer\).png
	nes/konami/Rush\'n_Attack/

	TwinBee_JP.nes
	TwinBee_JP.nes
	TwinBee_\(front\)_JP_large.png
	TwinBee_\(front\)_JP.png
	nes/konami/TwinBee/

	Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!_JP.nes
	Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!_JP.nes
	Moero_TwinBee_-_Cinnamon-hakase_o_Sukue_01.jpg
	Moero_TwinBee_-_Cinnamon-hakase_o_Sukue_01.jpg
	nes/konami/Moero_TwinBee/

	TwinBee_3_-_Poko_Poko_Daimaou_JP.nes
	TwinBee_3_-_Poko_Poko_Daimaou_JP.nes
	TwinBee_3_-_Poko_Poko_Daimaou_-_01.jpg
	TwinBee_3_-_Poko_Poko_Daimaou_-_01.jpg
	nes/konami/TwinBee_3/

	Crisis_Force_JP.nes
	Crisis_Force_JP.nes
	Crisis_Force_-_01_large.jpg
	Crisis_Force_-_01.jpg
	nes/konami/Crisis_Force/

	Goonies_JP.nes
	Goonies_JP.nes
	The_Goonies_Famicom_01.jpg
	The_Goonies_Famicom_01.jpg
	nes/konami/The_Goonies/

	Goonies_II_US.nes
	Goonies_II_US.nes
	The_Goonies_II_01.jpg
	The_Goonies_II_01.jpg
	nes/konami/The_Goonies_II/

	Akumajou_Dracula_JP.nes
	Akumajou_Dracula_JP.nes
	Castlevania_-_NA_-_01.jpg
	Castlevania_-_NA_-_01.jpg
	nes/konami/Castlevania/

	Castlevania_II_-_Simon\'s_Quest_US.nes
	Castlevania_II_-_Simon\'s_Quest_US.nes
	Castlevania_II_Simno\'s_Quest_01.jpg
	Castlevania_II_Simno\'s_Quest_01.jpg
	nes/konami/Castlevania_II/

	Castlevania_III_-_Dracula\'s_Curse_US.nes
	Castlevania_III_-_Dracula\'s_Curse_US.nes
	Castlevania_III_-_Dracula\'s_Curse_-_NA_-_01.jpg
	Castlevania_III_-_Dracula\'s_Curse_-_NA_-_01.jpg
	nes/konami/Castlevania_III/

	# Hudson Soft

	Adventure_Island_US.nes
	Adventure_Island_US.nes
	Hudson\'s_Adventure_Island_01.png
	Hudson\'s_Adventure_Island_01.png
	nes/hudson_soft/Adventure_Island/

	Adventure_Island_II_US.nes
	Adventure_Island_II_US.nes
	Adventure_Island_II_US_01.jpg
	Adventure_Island_II_US_01.jpg
	nes/hudson_soft/Adventure_Island_II/

	Adventure_Island_3_US.nes
	Adventure_Island_3_US.nes
	Adventure_Island_3_NES_01.jpg
	Adventure_Island_3_NES_01.jpg
	nes/hudson_soft/Adventure_Island_III/

	# Compile
	Gun-Nac_US.nes
	Gun-Nac_US.nes
	GunNacUSCover_large.jpg
	GunNacUSCover.jpg
	nes/compile/gun-nac/

	# Capcom
	1942_US.nes
	1942_US.nes
	1942_US_Flyer.jpg
	1942_US_Flyer.jpg
	nes/capcom/1942/

	1943_JP.nes
	1943_JP.nes
	1943_Flyer.jpg
	1943_Flyer.jpg
	nes/capcom/1943/

	Rescue_\'n_Dale_-_Rescue_Rangers_US.nes
	Rescue_\'n_Dale_-_Rescue_Rangers_US.nes
	Rescue_Rangers_NES_large.jpg
	Rescue_Rangers_NES.jpg
	nes/capcom/chipndalerescuerangers/

	Rescue_\'n_Dale_-_Rescue_Rangers_2_US.nes
	Rescue_\'n_Dale_-_Rescue_Rangers_2_US.nes
	Rescue_Rangers2_NES_large.jpg
	Rescue_Rangers2_NES.jpg
	nes/capcom/chipndalerescuerangers2/

	# Namco
	Xevious_US.nes
	Xevious_US.nes
	Xevious_Large.jpg
	Xevious.jpg
	nes/namco/Xevious/

	Battle_City_JP.nes
	Battle_City_JP.nes
	Battle_City_NES.jpg
	Battle_City_NES.jpg
	nes/namco/battlecity/

	Galaxian_JP.nes
	Galaxian_JP.nes
	Galaxian_JP_Flyer.jpg
	Galaxian_JP_Flyer.jpg
	nes/namco/Galaxian/

	Galaga_JP.nes
	Galaga_JP.nes
	Galaga.jpg
	Galaga.jpg
	nes/namco/Galaga/

	Gaplus_W.nes
	Gaplus_W.nes
	Gaplus_\(front\)_EU.jpg
	Gaplus_\(front\)_EU.jpg
	nes/namco/Gaplus/

	# Nintendo
	Super_Mario_Bros_EU.nes
	Super_Mario_Bros_US.nes
	Super_Mario_Bros_USA_Large.jpg
	Super_Mario_Bros_USA.jpg
	nes/nintendo/Super_Mario_Bros/

	F1_Race_JP.nes
	F-1_Race_US.nes
	F-1_Race_Cover_Large.jpg
	F-1_Race_Cover.jpg
	nes/nintendo/F-1_Race/

	Excitebike_JU.nes
	Excitebike_JU.nes
	Excitebike_NA_01.png
	Excitebike_NA_01.png
	nes/nintendo/Excitebike/

	Ice_Climber_JP.nes
	Ice_Climber_JP.nes
	NES_Ice_Climber_01.jpg
	NES_Ice_Climber_01.jpg
	nes/nintendo/Ice_Climber/

	# Technos Japan
	Double_Dragon_US.nes
	Double_Dragon_US.nes
	Double_Dragon_NES_-_01.jpg
	Double_Dragon_NES_-_01.jpg
	nes/technos/Double_Dragon/

	Double_Dragon_II_-_The_Revenge_EU.nes
	Double_Dragon_II_-_The_Revenge_EU.nes
	Double_Dragon_II_The_Revenge_NES_-_01.jpg
	Double_Dragon_II_The_Revenge_NES_-_01.jpg
	nes/technos/Double_Dragon_II/

	Double_Dragon_III_-_The_Sacred_Stones_US_.nes
	Double_Dragon_III_-_The_Sacred_Stones_US_.nes
	Double_Dragon_III_-_The_Rosetta_Stone_NES_01.jpg
	Double_Dragon_III_-_The_Rosetta_Stone_NES_01.jpg
	nes/technos/Double_Dragon_III/

	# Naxat Soft
	Summer_Carnival_\'92_-_Recca_JP.nes
	Summer_Carnival_\'92_-_Recca_JP.nes
	Summer_Carnival_92_Recca_JP_01_large.jpg
	Summer_Carnival_92_Recca_JP_01.jpg
	nes/naxat_soft/Summer_Carnival_\'92/

	#Sega
	Twin-Cobra_Genesis_EN.zip
	Twin-Cobra_Genesis_EN.zip
	Twin_Cobra_-_MDUS_01.jpg
	Twin_Cobra_-_MDUS_01.jpg
	sega-genesis/toaplan/Twin_Cobra/

	Contra_-_The_Hard_Corps_JP.zip
	Contra_-_The_Hard_Corps_JP.zip
	Contra_-_Hard_Corps_-_NA_-_01.jpg
	Contra_-_Hard_Corps_-_NA_-_01.jpg
	sega-genesis/konami/Contra_-_Hard_Corps/

	Castlevania_-_Bloodlines_US.zip
	Castlevania_-_Bloodlines_US.zip
	Castlevania_-_Bloodlines_-_NA_-_01.jpg
	Castlevania_-_Bloodlines_-_NA_-_01.jpg
	sega-genesis/konami/Castlevania_-_Bloodlines/

	Thunder_Force_III_JU.zip
	Thunder_Force_III_JU.zip
	Thunder_Force_III_SegaMD_01.jpg
	Thunder_Force_III_SegaMD_01.jpg
	sega-genesis/technosoft/Thunder_Force_III/

	Thunder_Force_II_UE.zip
	Thunder_Force_II_UE.zip
	Thunder_Force_II_US_01.jpg
	Thunder_Force_II_US_01.jpg
	sega-genesis/technosoft/Thunder_Force_II/
)

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
		if [ ! -L "$WEB_ROOT/data/$rom_to" ]; then
			ln -s $SOURCE/$base$rom $WEB_ROOT/data/$rom_to
			ls -l $WEB_ROOT/data/$rom_to
		fi
		if [ ! -L "$WEB_ROOT/data/images/$img_to" ]; then
			if [ ! -f $SOURCE/$base$img ] && [ -f $SOURCE/images/$img ]; then
				base=images/
			fi
			(ln -s $SOURCE/$base$img $WEB_ROOT/data/images/$img_to && ls -l $WEB_ROOT/data/images/$img_to) ||
				rm $WEB_ROOT/data/$rom_to
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
			--js assets/js/clock.js \
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
	--datamap)
		update_datamap
		;;
	--web)
		update_web
		;;
	--create-link)
		create_link
		;;
	--help)
		help
		;;
	*) ;;

	esac
