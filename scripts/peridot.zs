import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var BoP = 0;
var Plu = 1;

// Blocks need not be in same order as ingots/ore
var block = [
	<BiomesOPlenty:gemOre:5>
] as IItemStack[];

var gem = [
	<BiomesOPlenty:gems:2>
	,<RotaryCraft:rotarycraft_item_modingots:23>
	,<RotaryCraft:rotarycraft_item_modingots:74>
] as IItemStack[];

var ore = [
	<BiomesOPlenty:gemOre:4>
	,null
	,null
] as IItemStack[];

var colorMFR = 13;
var weightMFR = 35;

// Intermediate States
val oreOre = <ore:orePeridot>;
val gemOre = <ore:gemPeridot>;
val blockOre = <ore:blockPeridot>;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:95>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:299>;
val oreNether = <NetherOres:tile.netherores.ore.0:14>;
var oreNetherOutput = ore[BoP];
val essence = <magicalcrops:magicalcrops_ModCropEssence:7>;
val minechem = <minechem:minechemElement:105>;


val gemOutput = <ProjRed|Core:projectred.core.part:39>;
val blockOutput = <ProjRed|Exploration:projectred.exploration.stone:7>;
val oreOutput = <ProjRed|Exploration:projectred.exploration.ore:2>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val netherrack = <minecraft:netherrack>;

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
	bl.displayName = "Block of Peridot";
}

blockOutput.displayName = "Block of Peridot";

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

MiningLaser.removeOre( ore[BoP] );
MiningLaser.addOre( oreOutput.weight(weightMFR) );
MiningLaser.addPreferredOre( colorMFR, oreOutput );

// ========== //
//  Minechem  //
// ========== //

for item in gemOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem ], gemOutput, true, 300 );
