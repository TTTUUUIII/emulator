#!/bin/bash

LN_ARRAY=(
	# Platform: NES
	# KONAMI
	^nes/konami/Circus_Charlie/
	Circus_Charlie_JP.nes
	Circus_Charlie@JP.nes
	CircusCharlieFlyer.jpg
	images/Circus_CharlieFlyer.jpg

	^nes/konami/salamander/
	Salamander_JP.nes
	Salamander@JP.nes
	~Life_Force_-_Salamander@EU.nes
	~Life_Force_NES_NA_-_01.jpg

	^nes/konami/Gradius_II/
	Gradius_II_JP.nes
	Gradius_II@JP.nes
	~Gradius_II_-_GOFER_no_Yabou_-_01.jpg

	^nes/konami/contra/
	Contra_JP.nes
	Contra@JP.nes
	~Contra@US.nes
	~Contra_NA_01.jpg

	^nes/konami/Super_Contra/
	Super_Contra_JP.nes
	Super_Contra@JP.nes
	~Super_Contra@US.nes
	~Super_Contra_\(arcade\)_-_01.png

	^nes/konami/Rush\'n_Attack/
	Rush_\'n_Attack_US.nes
	Rush_\'n_Attack@US.nes
	~Rush_\'n_Attack@EU.nes
	~Green_Beret@JP.fds
	Rush\'n_Attack_\(Flyer\)_Large.png
	images/Rush_\'n_Attack_\(Flyer\).png

	^nes/konami/TwinBee/
	TwinBee_JP.nes
	TwinBee@JP.nes
	TwinBee_\(front\)_JP_large.png
	images/TwinBee_\(front\)_JP.png

	^nes/konami/Moero_TwinBee/
	Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!_JP.nes
	Moero_TwinBee_-_Cinnamon_Hakase_o_Sukue\!@JP.nes
	Stinger_US.nes
	Stinger@US.nes
	~Moero_TwinBee_-_Cinnamon-hakase_o_Sukue_01.jpg

	^nes/konami/TwinBee_3/
	TwinBee_3_-_Poko_Poko_Daimaou_JP.nes
	TwinBee_3_-_Poko_Poko_Daimaou@JP.nes
	~TwinBee_3_-_Poko_Poko_Daimaou_-_01.jpg

	^nes/konami/Crisis_Force/
	Crisis_Force_JP.nes
	Crisis_Force@JP.nes
	Crisis_Force_-_01_large.jpg
	images/Crisis_Force_-_01.jpg

	^nes/konami/The_Goonies/
	Goonies_JP.nes
	Goonies@JP.nes
	~The_Goonies_Famicom_01.jpg

	^nes/konami/The_Goonies_II/
	Goonies_II_US.nes
	Goonies_II@US.nes
	Goonies_II_EU.nes
	Goonies_II@EU.nes
	Goonies_II_JP.nes
	Goonies_II@JP.nes
	~The_Goonies_II_01.jpg

	^nes/konami/Castlevania/
	Akumajou_Dracula_JP.nes
	Akumajou_Dracula@JP.nes
	Castlevania_EU.nes
	Castlevania@EU.nes
	~Castlevania_-_NA_-_01.jpg

	^nes/konami/Castlevania_II/
	Castlevania_II_-_Simon\'s_Quest_US.nes
	Castlevania_II_-_Simon\'s_Quest@US.nes
	Castlevania_II_-_Simon\'s_Quest_EU.nes
	Castlevania_II_-_Simon\'s_Quest@EU.nes
	~Dracula_II_-_Noroi_no_Fuuin@JP.fds
	~Castlevania_II_Simno\'s_Quest_01.jpg

	^nes/konami/Castlevania_III/
	Castlevania_III_-_Dracula\'s_Curse_US.nes
	Castlevania_III_-_Dracula\'s_Curse@US.nes
	Castlevania_III_-_Dracula\'s_Curse_EU.nes
	Castlevania_III_-_Dracula\'s_Curse@EU.nes
	~Castlevania_III_-_Dracula\'s_Curse_-_NA_-_01.jpg

	^nes/konami/Teenage_Mutant_Ninja_Turtles_III_The_Manhattan_Project/
	Teenage_Mutant_Ninja_Turtles_III_-_The_Manhattan_Project_US.nes
	Teenage_Mutant_Ninja_Turtles_III_-_The_Manhattan_Project@US.nes
	Teenage_Mutant_Ninja_Turtles_2_-_The_Manhattan_Project_JP.nes
	Teenage_Mutant_Ninja_Turtles_2_-_The_Manhattan_Project@JP.nes
	~Teenage_Mutant_Ninja_Turtles_III_The_Manhattan_Project_NES_-_01.jpg

	^nes/konami/Teenage_Mutant_Ninja_Turtles_II_The_Arcade_Game/
	Teenage_Mutant_Ninja_Turtles_II_-_The_Arcade_Game_US.nes
	Teenage_Mutant_Ninja_Turtles_II_-_The_Arcade_Game@US.nes
	Teenage_Mutant_Hero_Turtles_II_-_The_Arcade_Game_EU.nes
	Teenage_Mutant_Hero_Turtles_II_-_The_Arcade_Game@EU.nes
	Teenage_Mutant_Ninja_Turtles_JP.nes
	Teenage_Mutant_Ninja_Turtles@JP.nes
	~Teenage_Mutant_Ninja_Turtles_II_The_Arcade_Game_NES_NA_-_01.jpg

	^nes/konami/Teenage_Mutant_Ninja_Turtles/
	~Teenage_Mutant_Ninja_Turtles@US.nes
	~Teenage_Mutant_Hero_Turtles@EU.nes
	~TMNT_NES_NA_-_01.jpg

	^nes/konami/Yie_Ar_Kung-Fu/
	~Yie_Ar_Kung-Fu@JP.nes
	~Yie_Ar_Kung-Fu_NES_-_01@US.jpg
	
	^nes/konami/Jackal/
	~Jackal@US.nes
	~Final_Command_-_Akai_Yousai@JP.fds
	~Jackal_NES_-_01@US.jpg

	# Tecmo
	^nes/tecmo/Ninja_Gaiden/
	~Ninja_Ryuukenden@JP.nes
	~Ninja_Gaiden@US.nes
	~Shadow_Warriors_-_Ninja_Gaiden@EU.nes
	~Ninja_Gaiden_NES_-_01@US.png

	^nes/tecmo/Star_Force/
	~Star_Force@JP.nes
	~Star_Force@US.nes
	~Star_Force@EU.nes
	~Star_Force_NES_-_01@US.jpg

	# Hudson Soft

	^nes/hudson_soft/Adventure_Island/
	Adventure_Island_US.nes
	Adventure_Island@US.nes
	~Hudson\'s_Adventure_Island_01.png

	^nes/hudson_soft/Adventure_Island_II/
	Adventure_Island_II_US.nes
	Adventure_Island_II@US.nes
	~Adventure_Island_II_US_01.jpg

	^nes/hudson_soft/Adventure_Island_III/
	Adventure_Island_3_US.nes
	Adventure_Island_3@US.nes
	~Adventure_Island_3_NES_01.jpg

	^nes/hudson_soft/Lode_Runner/
	Lode_Runner_JP.nes
	Lode_Runner@JP.nes
	Lode_Runner_US.nes
	Lode_Runner@US.nes
	Lode_Runner_EU.nes
	Lode_Runner@EU.nes
	~Lode_Runnder_NES_JP_-_01.jpg

	^nes/hudson_soft/Pooyan/
	~Pooyan@JP.nes
	~Pooyan_NES_-_01@US.jpg

	# Compile
	^nes/compile/gun-nac/
	Gun-Nac_US.nes
	Gun-Nac@US.nes
	Gun-Nac@JP.nes
	Gun-Nac@JP.nes
	GunNacUSCover_large.jpg
	images/GunNacUSCover.jpg

	# Toaplan
	^nes/toaplan/Twin_Cobra/
	Twin_Cobra_US.nes
	Twin_Cobra@US.nes
	~Twin_Cobra_NES_NA_01.jpg

	^nes/toaplan/Snow_Bros/
	Snow_Bros._JP.nes
	Snow_Bros.@JP.nes
	Snow_Bros._US.nes
	Snow_Bros.@US.nes
	Snow_Bros._EU.nes
	Snow_Bros.@EU.nes
	~Snow_Bros._-_NES_NA_-_01.jpg

	# Capcom
	^nes/capcom/1942/
	1942_US.nes
	1942@US.nes
	1942_US_Flyer.jpg
	images/1942_US_Flyer.jpg

	^nes/capcom/1943/
	1943_JP.nes
	1943@JP.nes
	~1943_-_The_Battle_of_Midway@US.nes
	~1943_Flyer.jpg

	^nes/capcom/chipndalerescuerangers/
	Rescue_\'n_Dale_-_Rescue_Rangers_US.nes
	Rescue_\'n_Dale_-_Rescue_Rangers@US.nes
	~Chip_to_Dale_no_Daisakusen@JP.nes
	Rescue_Rangers_NES_large.jpg
	images/Rescue_Rangers_NES.jpg

	^nes/capcom/chipndalerescuerangers2/
	Rescue_\'n_Dale_-_Rescue_Rangers_2_US.nes
	Rescue_\'n_Dale_-_Rescue_Rangers_2@US.nes
	~Chip_to_Dale_no_Daisakusen_2@JP.nes
	Rescue_Rangers2_NES_large.jpg
	images/Rescue_Rangers2_NES.jpg

	# Namco
	^nes/namco/Xevious/
	Xevious_US.nes
	Xevious@US.nes
	~Xevious@JP.nes
	~Xevious@EU.nes
	Xevious_Large.jpg
	images/Xevious.jpg

	^nes/namco/battlecity/
	Battle_City_JP.nes
	Battle_City@JP.nes
	~Battle_City_NES.jpg

	^nes/namco/Galaxian/
	Galaxian_JP.nes
	Galaxian@JP.nes
	~Galaxian_JP_Flyer.jpg

	^nes/namco/Galaga/
	Galaga_JP.nes
	Galaga@JP.nes
	Galaga_EU.nes
	Galaga@EU.nes
	~Galaga.jpg

	^nes/namco/Gaplus/
	Gaplus_W.nes
	Gaplus@W.nes
	~Gaplus_\(front\)_EU.jpg

	# Nintendo
	^nes/nintendo/Super_Mario_Bros/
	Super_Mario_Bros_EU.nes
	Super_Mario_Bros@EU.nes
	Super_Mario_Brothers@JP.fds
	Super_Mario_Brothers@JP.fds
	Super_Mario_Bros_USA_Large.jpg
	images/Super_Mario_Bros_USA.jpg

	^nes/nintendo/F-1_Race/
	F1_Race_JP.nes
	F-1_Race@JP.nes
	F-1_Race_Cover_Large.jpg
	images/F-1_Race_Cover.jpg

	^nes/nintendo/Excitebike/
	Excitebike_JU.nes
	Excitebike@JU.nes
	~Excitebike_NA_01.png

	^nes/nintendo/Ice_Climber/
	Ice_Climber_JP.nes
	Ice_Climber@JP.nes
	~NES_Ice_Climber_01.jpg

	# Technos Japan
	^nes/technos/Double_Dragon/
	Double_Dragon_US.nes
	Double_Dragon@US.nes
	Double_Dragon_EU.nes
	Double_Dragon@EU.nes
	~Double_Dragon_NES_-_01.jpg

	^nes/technos/Double_Dragon_II/
	Double_Dragon_II_-_The_Revenge_EU.nes
	Double_Dragon_II_-_The_Revenge@EU.nes
	~Double_Dragon_II_The_Revenge_NES_-_01.jpg

	^nes/technos/Double_Dragon_III/
	Double_Dragon_III_-_The_Sacred_Stones_US_.nes
	Double_Dragon_III_-_The_Sacred_Stones@US.nes
	Double_Dragon_III_-_The_Sacred_Stones_EU_.nes
	Double_Dragon_III_-_The_Sacred_Stones@EU.nes
	~Double_Dragon_III_-_The_Rosetta_Stone_NES_01.jpg

	# Naxat Soft
	^nes/naxat_soft/Summer_Carnival_\'92/
	Summer_Carnival_\'92_-_Recca_JP.nes
	Summer_Carnival_\'92_-_Recca@JP.nes
	Summer_Carnival_92_Recca_JP_01_large.jpg
	images/Summer_Carnival_92_Recca_JP_01.jpg

	^nes/broderbund/Spelunker/
	~Spelunker@JP.nes
	~Spelunker@US.nes
	~Spelunker_NES_-_01@US.jpg

	# SEGA
	^nes/sega/Sonic_the_Hedgehog/
	~Sonic_the_Hedgehog@US.nes
	~Sonic_NES_-_01@US.png

	# DotGears
	^nes/dotgears/FlappyBird/
	FlappyBird.nes
	FlappyBird@W.nes
	~FlappyBird_NES_-_01.jpg

	# Platform: SNES
	# Konami
	^snes/konami/Super_Castlevania_IV/
	Super_Castlevania_IV_US.zip
	Super_Castlevania_IV@US.zip
	~Super_Castlevania_IV_-_NA_-_01.jpg

	^snes/konami/Castlevania_Dracula_X/
	Castlevania_-_Dracula_X_US.zip
	Castlevania_-_Dracula_X@US.zip
	~Castlevania_Dracula_X_NA_-_01.jpg

	^snes/konami/Teenage_Mutant_Ninja_Turtles_IV_Turtles_in_Time/
	Teenage_Mutant_Ninja_Turtles_IV_-_Turtles_in_Time_US.zip
	Teenage_Mutant_Ninja_Turtles_IV_-_Turtles_in_Time@US.zip
	~Teenage_Mutant_Ninja_Turtles_IV_Turtles_in_Time_SNES_NA_-_01.jpg

	# Capcom
	^snes/capcom/Super_Street_Fighter_II_The_New_Challengers/
	Super_Street_Fighter_II_US.zip
	Super_Street_Fighter_II@US.zip
	~Super_Street_Fighter_II_SNES_NA_-_01.jpg

	^snes/capcom/Street_Fighter_II_The_World_Warrior/
	Street_Fighter_II_The_World_Warrior_US.zip
	Street_Fighter_II_The_World_Warrior@US.zip
	~Street_Fighter_II_The_World_Warrior_SNES_NA_-_01.jpg

	^snes/capcom/Street_Fighter_II_Turbo/
	Street_Fighter_II_Turbo_US.zip
	Street_Fighter_II_Turbo@US.zip
	~Street_Fighter_II_Turbo_SNES_NA_-_01.jpg

	^snes/capcom/Street_Fighter_Alpha_II/
	Street_Fighter_Alpha_2_US.zip
	Street_Fighter_Alpha_2_-_SNES@US.zip
	~Street-Fighter-Alpha_2_SNES_NA_-_01.webp

	# technosoft
	^snes/technosoft/Thunder_Spirits/
	Thunder_Spirits_US.zip
	Thunder_Spirits@US.zip
	~Thunder_Spirits_NA_-_01.jpg

	# Platform: Sega MD
	# toaplan
	^sega-genesis/toaplan/Twin_Cobra/
	Twin-Cobra_Genesis_EN.zip
	Twin-Cobra_Genesis@EN.zip
	~Kyuukyoku_Tiger@JP.zip
	~Twin_Cobra_-_MDUS_01.jpg

	^sega-genesis/toaplan/Snow_Bros._-_Nick_\&_Tom/
	Snow_Bros._-_Nick_\&_Tom.zip
	Snow_Bros._-_Nick_\&_Tom@US.zip
	~Snow_Bros._Genesis_NA_-_01.png

	# Capcom
	^sega-genesis/capcom/Street_Fighter_II_Champion_Edition/
	Street_Fighter_II\'_-_Champion_Edition_US.zip
	Street_Fighter_II\'_-_Champion_Edition@US.zip
	~Street_Fighter_II_Champion_Edition_Genesis_NA_-_01.jpg

	^sega-genesis/capcom/Street_Fighter_II_Special_Champion_Edition/
	Street_Fighter_II\'_-_Special_Champion_Edition_US.zip
	Street_Fighter_II\'_-_Special_Champion_Edition@US.zip
	~Street_Fighter_II_Special_Championship_Edition_NA_-_01.jpg

	^sega-genesis/capcom/Super_Street_Fighter_II_The_New_Challengers/
	Super_Street_Fighter_II_US_\(Virtual\ Console\).zip
	Super_Street_Fighter_II_-_MD@US.zip
	~Super_Street_Fighter_II_The_New_Challengers_NA_-_01.jpg

	# Konami
	^sega-genesis/konami/Contra_-_Hard_Corps/
	Contra_-_The_Hard_Corps_JP.zip
	Contra_-_The_Hard_Corps@JP.zip
	~Contra_-_Hard_Corps_-_NA_-_01.jpg

	^sega-genesis/konami/Castlevania_-_Bloodlines/
	Castlevania_-_Bloodlines_US.zip
	Castlevania_-_Bloodlines@US.zip
	~Castlevania_-_Bloodlines_-_NA_-_01.jpg

	^sega-genesis/konami/Teenage_Mutant_Ninja_Turtles_The_Hyperstone_Heist/
	Teenage_Mutant_Ninja_Turtles_-_The_Hyperstone_Heist_US.zip
	Teenage_Mutant_Ninja_Turtles_-_The_Hyperstone_Heist@US.zip
	~Teenage_Mutant_Ninja_Turtles_The_Hyperstone_Heist_MD_NA_-_01.jpg

	# Technosoft
	^sega-genesis/technosoft/Thunder_Force_III/
	Thunder_Force_III_JU.zip
	Thunder_Force_III@JU.zip
	~Thunder_Force_III_SegaMD_01.jpg

	^sega-genesis/technosoft/Thunder_Force_II/
	Thunder_Force_II_UE.zip
	Thunder_Force_II@UE.zip
	~Thunder_Force_II_US_01.jpg

	# Delphine
	^sega-genesis/delphine_software/Another_World/
	Out_of_This_World_US.zip
	Out_of_This_World@US.zip
	Another-World_NA_-_01.jpg
	images/Another_World_NA_-_01.jpg

	# Sega
	^sega-genesis/sega/Streets_of_Rage_3/
	~Streets_of_Rage_3@US.zip
	~Bare_Knuckle_III@JP.zip
	~Streets_of_Rage_3_MD_-_01@JP.jpg

	^sega-genesis/sega/Streets_of_Rage_2/
	~Streets_of_Rage_2@US.zip
	~Streets_of_Rage_2_MD_-_01@JP.jpg

	^sega-genesis/sega/Streets_of_Rage/
	~Bare_Knuckle_-_Ikari_no_Tekken_~_Streets_of_Rage@W.zip
	~Street_of_Rage_MD_-_01@JP.jpg

	^sega-genesis/sega/Sonic_the_Hedgehog/
	~Sonic_The_Hedgehog@US.zip
	~Sonic_-_01@JP.jpg

	^sega-genesis/sega/Sonic_the_Hedgehog2/
	~Sonic_The_Hedgehog_2@US.zip
	~Sonic2_-_01@JP.jpg


	# Platform: Sega Saturn
	# Capcom
	^sega-saturn/capcom/Street_Fighter_Alpha_II/
	Street_Fighter_Alpha_2_\(USA\).zip
	Street_Fighter_Alpha_2@US.zip
	~Street_Fighter_Alpha_2_Saturn_NA_-_01.webp

	# Platform: Arcade
	# SNK
	^arcade/snk/Metal_Slug_-_Super_Vehicle-001/
	~mslug.zip
	~Metal_Slug_-_Super_Vehicle-001_NEO_-_GEO.jpg

	^arcade/snk/Metal_Slug2_-_Super_Vehicle-001/
	~mslug2.zip
	~Metal_Slug2_-_Super_Vehicle-001_NEO_-_GEO.jpg

	^arcade/snk/Metal_Slug_X/
	~mslugx.zip
	~Metal_Slug_X_Arcade_Flyer.jpg

	# Technōs
	^arcade/technos/Double_Dragon_II_-_The_Revenge/
	~ddragon2.zip
	~Double_Dragon_II_-_The_Revenge_Arcade_-_01.jpg

	# toaplan
	^arcade/toaplan/Twin_Cobra/
	~twincobr.zip
	~Twin_Cobra_Romstar_Arcade_-_NA_-_01.jpg

	^arcade/toaplan/Snow_Bros./
	~snowbros.zip
	~Snow_Bros._Arcade_-_01@JP.jpg

	^arcade/toaplan/Snow_Bros.2/
	~snowbro2.zip
	~SnowBros.2_Arcade_-_01@JP.jpg

	^arcade/toaplan/Flying_Shark/
	~fshark.zip
	~Flying_Shark_Arcade_-_01@JP.jpg

	^arcade/toaplan/Hellfire/
	~hellfire.zip
	~Hellfire_Arcade_-_01@US.jpg

	^arcade/toaplan/Zero_Wing/
	~zerowing.zip
	~Zero_Wing_Arcade_-_01@US.jpg

	# irem
	^arcade/irem/R-Type/
	~rtype.zip
	~R-Type_Arcade_-_01@US.jpg


	# konami
	^arcade/konami/Yie_Ar_Kung-Fu/
	~yiear.zip
	~Yie_Ar_Kung-Fu_Arcade_-_01@US.jpg

	^arcade/konami/Jackal/
	~jackal.zip
	~Jackal_Arcade_-_01@US.jpg

	# Series Poster
	^images/
	~FlappyBird_NES_Poster.png
	~Gradius_Series_NES_Poster.jpg
	~Metal_Slug_Series_Poster.jpg
	~Street_Fighter_Series_Poster.jpg
	~Contra_-_Konami_Series_Poster.jpg
	~Castlevania_Series_NES_Poster.jpg
	~Streets_of_Rage_Series_Poster.jpg
	~Sonic_the_Hedgehog_Series_Poster.jpg
)