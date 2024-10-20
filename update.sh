#!/bin/bash

SOURCE=/var/www/media.snowland.ink/nes
DATA=/var/www/emulator.snowland.ink/data
MAP_ARRAY=(
    # KONAMI
	Circus_Charlie_JP.nes
    Circus_Charlie_JP.nes
    CircusCharlieFlyer.jpg
    Circus_CharlieFlyer.jpg
    konami/Circus_Charlie/

	Salamander_JP.nes 
	Salamander_JP.nes 
    Salamander_NES_large.jpg
    Salamander_NES.jpg
    konami/salamander/
    
    Contra_JP.nes
    Contra_JP.nes
    Contra_Logo_01.png
    Contra_Logo_01.png
    konami/contra/

    Super_Contra_JP.nes 
    Super_Contra_JP.nes
    Super_Contra_\(arcade\)_-_01.png
    Super_Contra_\(arcade\)_-_01.png
    konami/Super_Contra/

    Rush_\'n_Attack_US.nes
    Rush_\'n_Attack_US.nes
    Rush\'n_Attack_\(Flyer\)_Large.png
    Rush_\'n_Attack_\(Flyer\).png
    konami/Rush\'n_Attack/

    TwinBee_JP.nes
    TwinBee_JP.nes
    TwinBee_\(front\)_JP_large.png
    TwinBee_\(front\)_JP.png
    konami/TwinBee/

    Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!_JP.nes
    Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!_JP.nes
    Moero_TwinBee_-_Cinnamon-hakase_o_Sukue_01.jpg
    Moero_TwinBee_-_Cinnamon-hakase_o_Sukue_01.jpg
    konami/Moero_TwinBee/

    TwinBee_3_-_Poko_Poko_Daimaou_JP.nes
    TwinBee_3_-_Poko_Poko_Daimaou_JP.nes
    TwinBee_3_-_Poko_Poko_Daimaou_-_01.jpg
    TwinBee_3_-_Poko_Poko_Daimaou_-_01.jpg
    konami/TwinBee_3/

    # Compile
    Gun-Nac_US.nes
    Gun-Nac_US.nes
    GunNacUSCover_large.jpg
    GunNacUSCover.jpg
    compile/gun-nac/

    # Capcom
    1942_US.nes
    1942_US.nes
    1942_US_Flyer.jpg
    1942_US_Flyer.jpg
    capcom/1942/

    1943_JP.nes
    1943_JP.nes
    1943_Flyer.jpg
    1943_Flyer.jpg
    capcom/1943/

    Rescue_\'n_Dale_-_Rescue_Rangers_US.nes
    Rescue_\'n_Dale_-_Rescue_Rangers_US.nes
    Rescue_Rangers_NES_large.jpg
    Rescue_Rangers_NES.jpg
    capcom/chipndalerescuerangers/

    Rescue_\'n_Dale_-_Rescue_Rangers_2_US.nes
    Rescue_\'n_Dale_-_Rescue_Rangers_2_US.nes
    Rescue_Rangers2_NES_large.jpg
    Rescue_Rangers2_NES.jpg
    capcom/chipndalerescuerangers2/

    # Namco
    Xevious_US.nes
    Xevious_US.nes
    Xevious_Large.jpg
    Xevious.jpg
    namco/Xevious/

    Battle_City_JP.nes
    Battle_City_JP.nes
    Battle_City_NES.jpg
    Battle_City_NES.jpg
    namco/battlecity/

    Galaxian_JP.nes
    Galaxian_JP.nes
    Galaxian_JP_Flyer.jpg
    Galaxian_JP_Flyer.jpg
    namco/Galaxian/

    Galaga_JP.nes
    Galaga_JP.nes
    Galaga.jpg
    Galaga.jpg
    namco/Galaga/

    Gaplus_W.nes
    Gaplus_W.nes
    Gaplus_\(front\)_EU.jpg
    Gaplus_\(front\)_EU.jpg
    namco/Gaplus/

    # Nintendo
    Super_Mario_Bros_EU.nes
    Super_Mario_Bros_US.nes
    Super_Mario_Bros_USA_Large.jpg
    Super_Mario_Bros_USA.jpg
    nintendo/Super_Mario_Bros/

    F1_Race_JP.nes
    F-1_Race_US.nes
    F-1_Race_Cover_Large.jpg
    F-1_Race_Cover.jpg
    nintendo/F-1_Race/
)

function pr_error() {
	echo -e "\e[31m$1\e[0m"
}

function pr_warn() {
	echo -e "\e[33m$1\e[0m"
}

for ((i = 0; i < ${#MAP_ARRAY[@]}; i += 5)); do
	rom=${MAP_ARRAY[((i))]}
	rom_to=${MAP_ARRAY[((i + 1))]}
	img=${MAP_ARRAY[((i + 2))]}
	img_to=${MAP_ARRAY[((i + 3))]}
	base=${MAP_ARRAY[((i + 4))]}
	if [ ! -L "$DATA/$rom" ]; then
        ln -s $SOURCE/$base$rom $DATA/$rom_to
	else
        pr_warn "Link $DATA/$rom already exists, skip."
	fi
    if [ ! -L "$DATA/images/$img_to" ]; then
        ln -s $SOURCE/$base$img $DATA/images/$img_to || rm $DATA/$rom_to
    else
        pr_warn "Link $DATA/images/$img_to" already exists, skip.
    fi
done

exit $?
