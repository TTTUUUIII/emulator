#!/bin/bash

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

	Gradius_II_JP.nes
	Gradius_II_JP.nes
	Gradius_II_-_GOFER_no_Yabou_-_01.jpg
	Gradius_II_-_GOFER_no_Yabou_-_01.jpg
	nes/konami/Gradius_II/

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

	# Toaplan
	Twin_Cobra_US.nes
	Twin_Cobra_US.nes
	Twin_Cobra_NES_NA_01.jpg
	Twin_Cobra_NES_NA_01.jpg
	nes/toaplan/Twin_Cobra/

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

	# SNES
	# Konami
	Super_Castlevania_IV_US.zip
	Super_Castlevania_IV_US.zip
	Super_Castlevania_IV_-_NA_-_01.jpg
	Super_Castlevania_IV_-_NA_-_01.jpg
	snes/konami/Super_Castlevania_IV/

	Castlevania_-_Dracula_X_US.zip
	Castlevania_-_Dracula_X_US.zip
	Castlevania_Dracula_X_NA_-_01.jpg
	Castlevania_Dracula_X_NA_-_01.jpg
	snes/konami/Castlevania_Dracula_X/

	# technosoft
	Thunder_Spirits_US.zip
	Thunder_Spirits_US.zip
	Thunder_Spirits_NA_-_01.jpg
	Thunder_Spirits_NA_-_01.jpg
	snes/technosoft/Thunder_Spirits/

	#Sega MD
	# toaplan
	Twin-Cobra_Genesis_EN.zip
	Twin-Cobra_Genesis_EN.zip
	Twin_Cobra_-_MDUS_01.jpg
	Twin_Cobra_-_MDUS_01.jpg
	sega-genesis/toaplan/Twin_Cobra/

	# Capcom
	Street_Fighter_II\'_-_Champion_Edition_US.zip
	Street_Fighter_II\'_-_Champion_Edition_US.zip
	Street_Fighter_II_Champion_Edition_Genesis_NA_-_01.jpg
	Street_Fighter_II_Champion_Edition_Genesis_NA_-_01.jpg
	sega-genesis/capcom/Street_Fighter_II_Champion_Edition/

	Street_Fighter_II\'_-_Special_Champion_Edition_US.zip
	Street_Fighter_II\'_-_Special_Champion_Edition_US.zip
	Street_Fighter_II_Special_Championship_Edition_NA_-_01.jpg
	Street_Fighter_II_Special_Championship_Edition_NA_-_01.jpg
	sega-genesis/capcom/Street_Fighter_II_Special_Champion_Edition/

	Super_Street_Fighter_II_US_\(Virtual Console\).zip
	Super_Street_Fighter_II_US_\(Virtual Console\).zip
	Super_Street_Fighter_II_The_New_Challengers_NA_-_01.jpg
	Super_Street_Fighter_II_The_New_Challengers_NA_-_01.jpg
	sega-genesis/capcom/Super_Street_Fighter_II_The_New_Challengers/

	# Konami
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

	# Technosoft
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

	# Delphine
	Out_of_This_World_US.zip
	Out_of_This_World_US.zip
	Another—World_NA_-_01.jpg
	Another_World_NA_-_01.jpg
	sega-genesis/delphine_software/Another_World/
)
