import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var MC = 0;
var Nat = 1;
var Mek = 2;
var Rot = 3;
var RotN = 4;
var Ven = 5;
var IO = 4;
var TF = 6;

var blockTC = 1;
// Blocks need not be in same order as ingots/ore
var block = [
	<SpaceVenus:venus_decor:0>
] as IItemStack[];

var ingot = [
	<Magneticraft:item.dustSulfur>
	,<Natura:barleyFood:4>
	,<Mekanism:OtherDust:3>
	,<RotaryCraft:rotarycraft_item_modingots:48>
	,<RotaryCraft:rotarycraft_item_modingots:76>
	,<SpaceVenus:null:0>
	,<ThermalFoundation:material:16>
] as IItemStack[];
val ingotVen = <SpaceVenus:null:1>;

var ore = [
	<Magneticraft:sulfur_ore>
	,null
	,null
	,null
	,<SpaceIo:io_basic:4>
	,<SpaceVenus:venus_basic:4>
] as IItemStack[];
var cloud = <Natura:Cloud:3>;

var colorMFR = 4;
var weightMFR = 50;

// Intermediate States
val dustOre = <ore:dustCopper>;
val oreOre = <ore:oreSulfur>;
val ingotOre = <ore:dustSulfur>;
val blockOre = <ore:blockSulfur>;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:195>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:307>;
val oreNether = <NetherOres:tile.netherores.ore.1:5>;
var oreNetherOutput = ore[IO];
val minechem = <minechem:minechemElement:16>;

val ingotOutput = <Railcraft:dust:1>;
val blockOutput = <Magneticraft:block_sulfur>;
val oreOutput = <Railcraft:ore:0>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val sand = <minecraft:sand>;
val cinnabar = <ThermalFoundation:material:20>;
val pyro = <ThermalFoundation:material:512>;
val netherrack = <minecraft:netherrack>;

val oreApatite = <Forestry:resources:0>;
val ingotApatite = <Forestry:apatite>;
val ingotCoal = <minecraft:coal>;
val dustCoal = <ThermalFoundation:material:2>;
val ingotBlaze = <minecraft:blaze_rod>;
val dustBlaze = <minecraft:blaze_powder>;
val gravel = <minecraft:gravel>;
val oreQuartz = <minecraft:quartz_ore>;
val ingotQuartz = <minecraft:quartz>;
val lapisOre = <ore:oreLapis>;
val oreLapis = <minecraft:lapis_ore>;
val ingotLapis = <minecraft:dye:4>;
val soulsand = <minecraft:soul_sand>;
val netherbrick = <minecraft:nether_brick>;
val doreQuartz = <denseores:block0:7>;

// =========== //
//  Main Loop  //
// =========== //

ingotOre.add( ingot[Nat] );
blockOre.add( block[0] );

for i, ing in ingot {
	recipes.remove( ing );
}

for item in oreOre.items {
	mods.extraUtils.QED.addShapedRecipe( ingotOutput * 3, [
		[item, <minecraft:coal>, null],
		[null, null, null],
		[null, null, null]
	]);
}
	
// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Sulfur";
}

blockOutput.displayName = "Block of Sulfur";

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

mods.appeng.Grinder.removeRecipe( ingot[TF] );
mods.appeng.Grinder.addRecipe( oreNether, ingotOutput * 24, 4 );

// IE
mods.immersiveengineering.Crusher.addRecipe( ingotOutput, ingotVen, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( ingotOutput * 2, oreOre, 6000, null, 0 );

mods.immersiveengineering.Crusher.removeRecipe( ingot[TF] );

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( ore[MC] );
	mods.magneticraft.Crusher.addRecipe( oreOutput, ingotOutput, ingotOutput, 0.20, null, 0 );
}
	
// ==================== //
//  Add Ingot Handling  //
// ==================== //

furnace.remove( ingot[TF] );
mods.thermalexpansion.Furnace.removeRecipe( oreOre );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );
mods.immersiveengineering.ArcFurnace.removeRecipe( ingotVen );

recipes.addShapeless( ingotOutput, [oreOre, <ore:dustPyrotheum>] );
furnace.addRecipe( ingotOutput, oreOre );
furnace.addRecipe( ingotOutput, flakes );
furnace.addRecipe( ingotOutput, nflakes );

mods.thermalexpansion.Furnace.addRecipe( 1600, oreOutput, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput * 3 );
mods.thermalexpansion.Furnace.addRecipe( 1600, nflakes, ingotOutput * 3 );

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );

mods.thermalexpansion.Pulverizer.removeRecipe( ingotVen );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, ingotVen, ingotOutput * 2 );
recipes.remove( ingotVen );

recipes.addShapeless( ingotVen, [ ingotOre, ingotOre ] );
recipes.addShapeless( ingotOutput * 2, [ ingotVen ] );
recipes.addShapeless( ingotOutput * 9, [ blockOre ] );

recipes.addShapeless( ingotOutput, [ cloud, cloud, cloud, cloud ] );
recipes.removeShaped( <minecraft:gunpowder>, [ [ ingot[Nat], ingot[Nat] ], [ ingot[Nat], ingot[Nat] ] ] );

mods.thermalexpansion.Smelter.removeRecipe( oreOre, slagRich );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, slagRich, ingotOutput * 3, slag, 75 );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, sand );
mods.thermalexpansion.Smelter.addRecipe( 3200, oreOutput, sand, ingotOutput * 2, slagRich, 5 );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, cinnabar );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, cinnabar, ingotOutput * 3, slagRich, 75 );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, pyro );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, pyro, ingotOutput * 2, slagRich, 15 );
mods.thermalexpansion.Smelter.removeRecipe( ingotOre, sand );

mods.thermalexpansion.Pulverizer.removeRecipe( oreOre );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreOutput, ingotOutput * 6 );
mods.thermalexpansion.Pulverizer.removeRecipe( oreNether );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreNether, ingotOutput * 24, netherrack, 15 );

// ============= //
//  Secondaries  //
// ============= //

mods.thermalexpansion.Pulverizer.removeRecipe( oreApatite );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreApatite, ingotApatite * 12, ingotOutput, 10 );
mods.thermalexpansion.Pulverizer.removeRecipe( ingotCoal );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, ingotCoal, dustCoal, ingotOutput, 15 );
mods.thermalexpansion.Pulverizer.removeRecipe( ingotBlaze );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, ingotBlaze, dustBlaze * 4, ingotOutput, 50 );
mods.thermalexpansion.Pulverizer.removeRecipe( netherrack );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, netherrack, gravel, ingotOutput, 15 );
mods.thermalexpansion.Pulverizer.removeRecipe( oreQuartz );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreQuartz, ingotQuartz * 1, ingotOutput, 15 );
mods.thermalexpansion.Pulverizer.removeRecipe( lapisOre );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, oreLapis, ingotLapis * 12, ingotOutput, 20 );

mods.thermalexpansion.Smelter.removeRecipe( netherrack * 4, soulsand );
mods.thermalexpansion.Smelter.addRecipe( 4000, netherrack * 4, soulsand, netherbrick * 2, ingotOutput, 20 );

mods.immersiveengineering.Crusher.removeRecipe( dustBlaze );
mods.immersiveengineering.Crusher.addRecipe( ingotBlaze, dustBlaze * 4, 1600, ingotOutput, 0.5 );
mods.immersiveengineering.Crusher.removeRecipe( ingotQuartz );
mods.immersiveengineering.Crusher.addRecipe( oreQuartz, ingotQuartz * 3, 6000, ingotOutput, 0.15 );
mods.immersiveengineering.Crusher.addRecipe( doreQuartz, ingotQuartz * 12, 14000, ingotOutput * 2, 0.30 );

// ============== //
//  Ore Handling  //
// ============== //

MiningLaser.removeOre( ore[IO] );
MiningLaser.addOre( oreOutput.weight( weightMFR ) );
MiningLaser.addPreferredOre( colorMFR, oreOutput ); 

// ========== //
//  Minechem  //
// ========== //

for item in ingotOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem ], ingotOutput, true, 300 );
