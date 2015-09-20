import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var BR = 0;
var Rea = 1;
var Rot = 2;
var Ven = 3;

var blockVen = 1;
var blockBR = 0;
// Blocks need not be in same order as ingots/ore
var block = [
	<BigReactors:BRMetalBlock:0>
	,<SpaceVenus:venus_decor:1>
] as IItemStack[];

var ingot = [
	<BigReactors:BRIngot:0>
	,<ReactorCraft:reactorcraft_item_ingots:0>
	,<RotaryCraft:rotarycraft_item_modingots:49>
	,<SpaceVenus:null:3>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:36>;

var ore = [
	<BigReactors:YelloriteOre>
	,<ReactorCraft:reactorcraft_block_ore:5>
	,<ReactorCraft:reactorcraft_block_ore:1>
	,<SpaceVenus:venus_basic:5>
] as IItemStack[];
var oreMC = <Magneticraft:uranium_ore>;

var nuggetBR = 0;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<aobd:nuggetYellorium>
] as IItemStack[];

val dustBR = <BigReactors:BRIngot:4>;
val dustDirty = <aobd:dustDirtyUranium>;
val dustDirty2 = <aobd:dustDirtyYellorium>;
val dustSecondary = <Magneticraft:item.dust_uranium>;
val dustAOBD = <aobd:crushedUranium>;
val dustAOBD2 = <aobd:crushedYellorium>;
val dustMC = <Magneticraft:item.dust_uranium>;
val chunk = <Magneticraft:item.chunk_uranium>;
val rubble = <Magneticraft:item.rubble_uranium>;
val pebbles = <Magneticraft:item.pebbles_uranium>;
val chunkYel = <aobd:chunkYellorium>;
val rubbleYel = <aobd:rubbleYellorium>;
val pebblesYel = <aobd:pebblesYellorium>;
val essence = <magicalcrops:magicalcrops_ModCropEssence:15>;
var colorMFR = 5;
var weightMFR = 20;

// Intermediate States
val cluster = <aobd:clusterUranium>;
val cluster2 = <aobd:clusterYellorium>;
val dustOre = <ore:dustUranium>;
val oreOre = <ore:oreUranium>;
val nuggetOre = <ore:nuggetUranium>;
val ingotOre = <ore:ingotUranium>;
val liquid = <liquid:uranium>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val liquid2 = <liquid:yellorium>;
val liquid3 = <liquid:aobdyellorium>;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:43>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:275>;
val oreNether = <NetherOres:tile.netherores.ore.0:11>;
val oreDense = <denseores:block0:23>;
val minechem = <minechem:minechemElement:92>;
val bee = <ExtraBees:misc:27>;

val ingotOutput = <RotaryCraft:rotarycraft_item_modingots:10>;
val blockOutput = <aobd:blockUranium>;
val nuggetOutput = <aobd:nuggetUranium>;
val oreOutput = <minechem:tile.oreUranium>;
val dustOutput = <Magneticraft:item.dust_uranium>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val sand = <minecraft:sand>;
val cinnabar = <ThermalFoundation:material:20>;
val pyro = <ThermalFoundation:material:512>;

oreOre.add( ore[Rea] );

// =========== //
//  Main Loop  //
// =========== //

oreOre.add( ore[BR] );
oreOre.add( ore[Rot] );

for i, ing in ingot {
	recipes.remove( ing );

	if ( i != Ven ) {
		furnace.remove( ing );
	}
	
	if ( i == Rea ) {
		mods.extraUtils.QED.removeRecipe( ing );
	}
}

mods.extraUtils.QED.removeRecipe( ingot[BR] );

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

var oreYel = <ore:blockYellorium>;
oreYel.add( block[blockVen] );
oreYel.add( blockOutput );

var blockOre = <ore:blockUranium>;
blockOre.add( block[blockVen] );
blockOre.add( block[blockBR] );

for i, bl in block {
	recipes.remove( bl );
}

mods.tconstruct.Casting.removeBasinRecipe( block[blockBR] );
mods.tconstruct.Casting.addBasinRecipe(blockOutput, liquid2 * iliqBlock, null, false, 20);
mods.tconstruct.Casting.addBasinRecipe(blockOutput, liquid3 * iliqBlock, null, false, 20);

blockOutput.displayName = "Block of Uranium";

// ================ //
//  Ingot Handling  //
// ================ //

mods.witchinggadgets.InfernalBlastfurnace.removeRecipe( ingot[BR] );

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );

mods.tconstruct.Casting.removeTableRecipe( ingot[BR] );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingot[BR] );

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
}

mods.tconstruct.Casting.removeTableRecipe( nugget[nuggetBR] );
mods.tconstruct.Casting.addTableRecipe( nuggetOutput, liquid2 * iliqIngot, <TConstruct:metalPattern:27>, false, 20);
mods.tconstruct.Casting.addTableRecipe( nuggetOutput, liquid3 * iliqIngot, <TConstruct:metalPattern:27>, false, 20);

// =============== //
//  Dust Handling  //
// =============== //

dustOre.add( dustAOBD );
dustOutput.displayName = "Pulverized Uranium";

recipes.remove( dustBR );
recipes.addShapeless( dustOutput, [
	bee, bee,
	bee, bee
]);

mods.appeng.Grinder.removeRecipe( dustBR );
mods.appeng.Grinder.addRecipe( oreNether, dustOutput * 4, 4 );

mods.thermalexpansion.Pulverizer.removeRecipe( oreNether );
mods.thermalexpansion.Pulverizer.addRecipe( 3200, oreNether, dustOutput * 4, <minecraft:netherrack>, 15 );

mods.thermalexpansion.Pulverizer.removeRecipe( ingot[BR] );
mods.thermalexpansion.Pulverizer.addRecipe( 2400, ingotOutput, dustOutput );

mods.thermalexpansion.Pulverizer.removeRecipe( <ore:oreUranium> );
mods.thermalexpansion.Pulverizer.addRecipe( 4000, oreOutput, dustOutput * 2, dustSecondary, 10 );

mods.thermalexpansion.Pulverizer.removeRecipe( cluster );
mods.thermalexpansion.Pulverizer.addRecipe( 4800, cluster, dustOutput * 2 );
mods.thermalexpansion.Pulverizer.removeRecipe( cluster2 );
mods.thermalexpansion.Pulverizer.addRecipe( 4800, cluster2, dustOutput * 2 );

// Mek
mods.mekanism.Enrichment.removeRecipe( dustDirty );
mods.mekanism.Enrichment.addRecipe( dustDirty, dustOutput );
mods.mekanism.Enrichment.removeRecipe( dustDirty2 );
mods.mekanism.Enrichment.addRecipe( dustDirty2, dustOutput );


var oreAll = [
	<BigReactors:YelloriteOre>
	,<SpaceVenus:venus_basic:5>
	,<Magneticraft:uranium_ore>
	,oreOutput
] as IItemStack[];

for i, item in oreAll {
	mods.mekanism.Enrichment.removeRecipe( item );
}
for item in oreOre.items {
	mods.mekanism.Enrichment.addRecipe( item, dustOutput * 2 );	
}

//mods.mekanism.Crusher.removeRecipe( dustBR );
for item in ingotOre.items {
	mods.mekanism.Crusher.addRecipe( item, dustOutput );
}

dustDirty.displayName = "Dirty Pulverized Uranium";

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.removeRecipe( dustBR );

// AOBD
mods.thermalexpansion.Furnace.removeRecipe( dustAOBD );

furnace.addRecipe( ingotOutput, dustAOBD );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD, ingotOutput );

mods.thermalexpansion.Furnace.removeRecipe( dustAOBD2 );

furnace.addRecipe( ingotOutput, dustAOBD2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD2, ingotOutput );

for i, item in oreAll {
	mods.railcraft.RockCrusher.removeRecipe( item );
}		
for item in oreOre.items {
	mods.railcraft.RockCrusher.addRecipe( item, false, false, [ dustOutput ], [ 100 ] );
}

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( oreMC );
	mods.magneticraft.Crusher.addRecipe( oreMC, chunk, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( chunk );
	mods.magneticraft.Grinder.addRecipe( chunk, rubble, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( rubble );
	mods.magneticraft.Grinder.addRecipe( rubble, pebbles, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Sifter.removeRecipe( pebbles );
	mods.magneticraft.Sifter.addRecipe( pebbles, dustOutput * 3, dustSecondary, 0.05 );
	
	// Yellorium	
	mods.magneticraft.Crusher.removeRecipe( ore[BR] );
	mods.magneticraft.Crusher.addRecipe( ore[BR], chunk, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( chunkYel );
	mods.magneticraft.Grinder.addRecipe( chunkYel, rubble, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( rubbleYel );
	mods.magneticraft.Grinder.addRecipe( rubbleYel, pebbles, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Sifter.removeRecipe( pebblesYel );
	mods.magneticraft.Sifter.addRecipe( pebblesYel, dustOutput * 3, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( ingot[BR] );
	mods.magneticraft.Grinder.addRecipe( ingot[BR], dustOutput, null, 0, null, 0 );	
}

mods.thermalexpansion.Furnace.removeRecipe( chunk );
mods.thermalexpansion.Furnace.removeRecipe( rubble );
mods.thermalexpansion.Furnace.removeRecipe( pebbles );
furnace.addRecipe( ingotOutput * 2, chunk );
furnace.addRecipe( ingotOutput * 2, rubble );
furnace.addRecipe( ingotOutput * 2, pebbles );
mods.thermalexpansion.Furnace.addRecipe( 1600, chunk, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, rubble, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, pebbles, ingotOutput * 2 );

mods.thermalexpansion.Furnace.removeRecipe( chunkYel );
mods.thermalexpansion.Furnace.removeRecipe( rubbleYel );
mods.thermalexpansion.Furnace.removeRecipe( pebblesYel );
furnace.addRecipe( ingotOutput * 2, chunkYel );
furnace.addRecipe( ingotOutput * 2, rubbleYel );
furnace.addRecipe( ingotOutput * 2, pebblesYel );
mods.thermalexpansion.Furnace.addRecipe( 1600, chunkYel, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, rubbleYel, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, pebblesYel, ingotOutput * 2 );

// ==================== //
//  Add Ingot Handling  //
// ==================== //

mods.thermalexpansion.Furnace.removeRecipe( ore[BR] );
mods.thermalexpansion.Furnace.removeRecipe( oreOre );
mods.thermalexpansion.Furnace.removeRecipe( dustOre );
mods.thermalexpansion.Furnace.removeRecipe( cluster2 );

recipes.addShapeless( ingotOutput, [oreOre, <ore:dustPyrotheum>] );
furnace.addRecipe( ingotOutput, oreOre );
furnace.addRecipe( ingotOutput * 2, cluster );
furnace.addRecipe( ingotOutput * 2, cluster2 );
furnace.addRecipe( ingotOutput, dustOre );

mods.witchinggadgets.InfernalBlastfurnace.addRecipe( ingotOutput * 3, cluster, 200, nuggetOutput, true );

mods.thermalexpansion.Furnace.addRecipe( 1600, dustOutput, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, oreOutput, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, cluster2, ingotOutput * 2 );

mods.tconstruct.Casting.addTableRecipe( ingotOutput, liquid * iliqIngot, <TConstruct:metalPattern>, false, 20);

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, dustOre, null, 100, 512, [] );

mods.thermalexpansion.Smelter.removeRecipe( ore[BR], slagRich );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, slagRich );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, slagRich, ingotOutput, slag, 75 );
mods.thermalexpansion.Smelter.removeRecipe( ore[BR], sand );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, sand );
mods.thermalexpansion.Smelter.addRecipe( 2000, oreOutput, sand, ingotOutput, slagRich, 5 );
mods.thermalexpansion.Smelter.removeRecipe( ore[BR], cinnabar );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, cinnabar );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, cinnabar, ingotOutput * 3, ingotOutput, 100 );
mods.thermalexpansion.Smelter.removeRecipe( ore[BR], pyro );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, pyro );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, pyro, ingotOutput * 2, slagRich, 15 );
mods.thermalexpansion.Smelter.removeRecipe( dustBR, sand );
mods.thermalexpansion.Smelter.addRecipe( 200, dustOutput, sand, ingotOutput * 2 );

// ============== //
//  Ore Handling  //
// ============== //

mods.mekanism.Combiner.addRecipe( dustOutput * 8, oreOutput );
mods.mekanism.Combiner.addRecipe( dustBR * 8, oreOutput );

MiningLaser.removeOre( ore[BR] );
MiningLaser.removeOre( oreMC );
MiningLaser.removeOre( ore[Rot] );
MiningLaser.removeOre( oreOutput );
MiningLaser.addOre( oreOutput.weight( weightMFR * 2 ) );
MiningLaser.addPreferredOre( colorMFR, oreOutput ); 

// ========== //
//  Minechem  //
// ========== //

for item in ingotOre.items {
	Synthesiser.removeRecipe( item );
}
for item in dustOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem ], ingotOutput, true, 300 );
Synthesiser.addRecipe( [ null, minechem ], dustOutput, true, 300 );
