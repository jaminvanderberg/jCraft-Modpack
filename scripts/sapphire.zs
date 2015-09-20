import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var BoP = 0;
var Plu = 1;

// Blocks need not be in same order as ingots/ore
var block = [
	<BiomesOPlenty:gemOre:13>
	,<SpacePluto:pluto_block:7>
] as IItemStack[];

var gem = [
	<BiomesOPlenty:gems:6>
	,<SpacePluto:null:0>
	,<RotaryCraft:rotarycraft_item_modingots:25>
	,<RotaryCraft:rotarycraft_item_modingots:73>
] as IItemStack[];

var ore = [
	<BiomesOPlenty:gemOre:12>
	,<SpacePluto:pluto_block:4>
	,null
	,null
] as IItemStack[];

var colorMFR = 11;
var weightMFR = 35;

// Intermediate States
val oreOre = <ore:oreSapphire>;
val gemOre = <ore:gemSapphire>;
val blockOre = <ore:blockSapphire>;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:103>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:295>;
val oreNether = <NetherOres:tile.netherores.ore.0:15>;
var oreNetherOutput = ore[Plu];
val essence = <magicalcrops:magicalcrops_ModCropEssence:5>;

val gemOutput = <ProjRed|Core:projectred.core.part:38>;
val blockOutput = <ProjRed|Exploration:projectred.exploration.stone:6>;
val oreOutput = <ProjRed|Exploration:projectred.exploration.ore:1>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val netherrack = <minecraft:netherrack>;

blockOre.add( block[Plu] );
gemOre.add( gem[Plu] );

// ================= //
//  Space Equipment  //
// ================= //

recipes.remove( <SpacePluto:sapphire_pickaxe> );
recipes.remove( <SpacePluto:sapphire_axe> );
recipes.remove( <SpacePluto:sapphire_hoe> );
recipes.remove( <SpacePluto:sapphire_spade> );
recipes.remove( <SpacePluto:sapphire_sword> );
recipes.remove( <SpacePluto:sapphire_helmet> );
recipes.remove( <SpacePluto:sapphire_chestplate> );
recipes.remove( <SpacePluto:sapphire_leggings> );
recipes.remove( <SpacePluto:sapphire_boots> );

// =========== //
//  Main Loop  //
// =========== //

for i, g in gem {
	recipes.remove( g );
	
	if ( i != BoP ) {
		furnace.remove( g );
	}
}

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Sapphire";
}

blockOutput.displayName = "Block of Sapphire";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );

// ===================== //
//  Nether Ore Handling  //
// ===================== //

furnace.remove( oreNetherOutput );
furnace.addRecipe( oreOutput * 2, oreNether );

mods.thermalexpansion.Furnace.removeRecipe( oreNether );
mods.thermalexpansion.Furnace.addRecipe( 1600, oreNether, oreOutput * 2 );

mods.thermalexpansion.Smelter.removeRecipe( oreNether, <minecraft:sand> );
mods.thermalexpansion.Smelter.addRecipe( 3200, oreNether, <minecraft:sand>, oreOutput * 2, slagRich, 10 );

mods.thermalexpansion.Smelter.removeRecipe( oreNether, slagRich );
mods.thermalexpansion.Smelter.addRecipe( 7200, oreNether, slagRich, oreOutput * 3, slag, 100 );


// =============== //
//  Dust Handling  //
// =============== //

mods.immersiveengineering.Crusher.addRecipe( gemOutput * 2, oreOre, 6000, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( gemOutput * 4, oreNether, 6000, null, 0 );

mods.immersiveengineering.Crusher.removeRecipe( gem[BoP] );


// ==================== //
//  Add Ingot Handling  //
// ==================== //

mods.appeng.Grinder.removeRecipe( gem[BoP] );
mods.appeng.Grinder.addRecipe( oreNether, gemOutput * 5, 4 );

furnace.addRecipe( gemOutput, oreOre );
furnace.addRecipe( gemOutput, flakes );
furnace.addRecipe( gemOutput, nflakes );

mods.thermalexpansion.Furnace.removeRecipe( oreOre );
mods.thermalexpansion.Furnace.addRecipe( 1600, oreOutput, gemOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, gemOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, nflakes, gemOutput );

mods.thermalexpansion.Pulverizer.removeRecipe( oreOre );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreOutput, gemOutput * 2 );
mods.thermalexpansion.Pulverizer.removeRecipe( oreNether );
mods.thermalexpansion.Pulverizer.addRecipe( 3200, oreNether, gemOutput * 5, netherrack, 15 );

// ============== //
//  Ore Handling  //
// ============== //

recipes.remove( ore[BoP] );
recipes.addShaped( oreOutput * 6, [
	[ essence, essence, essence ],
	[ essence, null, essence ],
	[ essence, essence, essence ]
]);

MiningLaser.removeOre( ore[Plu] );
MiningLaser.addOre( oreOutput.weight(weightMFR) );
MiningLaser.addPreferredOre( colorMFR, oreOutput );
