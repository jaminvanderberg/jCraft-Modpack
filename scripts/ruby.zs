import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var BoP = 0;
var Plu = 1;

// Blocks need not be in same order as ingots/ore
var block = [
	<BiomesOPlenty:gemOre:3>
	,<SpaceVenus:venus_decor:2>
] as IItemStack[];

var gem = [
	<BiomesOPlenty:gems:1>
	,<SpaceVenus:null:2>
	,<RotaryCraft:rotarycraft_item_modingots:24>
] as IItemStack[];

var ore = [
	<BiomesOPlenty:gemOre:2>
	,<SpaceVenus:venus_basic:6>
	,null
] as IItemStack[];

var colorMFR = 14;
var weightMFR = 35;

// Intermediate States
val oreOre = <ore:oreRuby>;
val gemOre = <ore:gemRuby>;
val blockOre = <ore:blockRuby>;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:99>;
val oreNether = <NetherOres:tile.netherores.ore.0:13>;
var oreNetherOutput = ore[BoP];
val essence = <magicalcrops:magicalcrops_ModCropEssence:6>;
val minechem = <minechem:minechemElement:68>;
val minechem2 = <minechem:minechemElement:24>;



val gemOutput = <ProjRed|Core:projectred.core.part:37>;
val blockOutput = <ProjRed|Exploration:projectred.exploration.stone:5>;
val oreOutput = <ProjRed|Exploration:projectred.exploration.ore:0>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val netherrack = <minecraft:netherrack>;

blockOre.add( block[Plu] );
gemOre.add( gem[Plu] );

// ================= //
//  Space Equipment  //
// ================= //

recipes.remove( <SpaceVenus:ruby_pickaxe> );
recipes.remove( <SpaceVenus:ruby_axe> );
recipes.remove( <SpaceVenus:ruby_hoe> );
recipes.remove( <SpaceVenus:ruby_spade> );
recipes.remove( <SpaceVenus:ruby_sword> );
recipes.remove( <SpaceVenus:ruby_helmet> );
recipes.remove( <SpaceVenus:ruby_chestplate> );
recipes.remove( <SpaceVenus:ruby_leggings> );
recipes.remove( <SpaceVenus:ruby_boots> );

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
	bl.displayName = "Block of Ruby";
}

blockOutput.displayName = "Block of Ruby";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( flakes );

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

mods.thermalexpansion.Furnace.removeRecipe( oreOre );
mods.thermalexpansion.Furnace.addRecipe( 1600, oreOutput, gemOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, gemOutput );

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

MiningLaser.removeOre( ore[BoP] );
MiningLaser.addOre( oreOutput.weight(weightMFR) );
MiningLaser.addPreferredOre( colorMFR, oreOutput );

// ========== //
//  Minechem  //
// ========== //

for item in gemOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem, minechem2 ], gemOutput, true, 300 );
