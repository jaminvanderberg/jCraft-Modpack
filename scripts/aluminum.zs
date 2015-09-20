import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var GC = 0;
var IE = 1;
var Rot = 2;
var Rot2 = 3;

var blockTC = 0;
// Blocks need not be in same order as ingots/ore
var block = [
	<GalacticraftCore:tile.gcBlockCore:11>
	,<ImmersiveEngineering:storage:1>
] as IItemStack[];

var ingot = [
	<GalacticraftCore:item.basicItem:5>
	,<ImmersiveEngineering:metal:1>
	,<RotaryCraft:rotarycraft_item_modingots:6>
	,<RotaryCraft:rotarycraft_item_compacts:4>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:36>;

var ore = [
	<GalacticraftCore:tile.gcBlockCore:7>
	,<ImmersiveEngineering:ore:1>
	,null
	,null
] as IItemStack[];

// Nuggets need not be in same order as ingots/ore
var nugget = [
	<ImmersiveEngineering:metal:23>
] as IItemStack[];

val dustDirty = <aobd:dustDirtyAluminium>;
val dustIE = <ImmersiveEngineering:metal:11>;
val dustSecondary = <ThermalFoundation:material:0>;
val dustAOBD = <aobd:crushedAluminium>;
val dustMC = <Magneticraft:item.dust_aluminium>;
val chunk = <Magneticraft:item.chunk_aluminium>;
val rubble = <Magneticraft:item.rubble_aluminium>;
val pebbles = <Magneticraft:item.pebbles_aluminium>;
val dustRot = <RotaryCraft:rotarycraft_item_powders:8>;
val essence = <magicalcrops:magicalcrops_ModCropEssence:8>;
var colorMFR = 0;
var weightMFR = 60;

// Intermediate States
val cluster = <aobd:clusterAluminium>;
val cluster2 = <WitchingGadgets:item.WG_Cluster:0>;
val dustOre = <ore:dustAluminum>;
val oreOre = <ore:oreAluminum>;
val nuggetOre = <ore:nuggetAluminum>;
val ingotOre = <ore:ingotAluminum>;
val liquid = <liquid:aluminum.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:27>;
val oreberry = <TConstruct:oreBerries:4>;
val oreDense = <denseores:block0:1>;
val minechem = <minechem:minechemElement:13>;

dustOre.add( dustMC );

val ingotOutput = <TConstruct:materials:11>;
val blockOutput = <TConstruct:MetalBlock:6>;
val nuggetOutput = <TConstruct:materials:22>;
val oreOutput = <TConstruct:SearedBrick:5>;
val dustOutput = <TConstruct:materials:40>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	furnace.remove( ing );
	
	mods.extraUtils.QED.removeRecipe( ing );
}

mods.extraUtils.QED.removeRecipe( ingotOutput );
mods.extraUtils.QED.removeRecipe( ingot[GC] );

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
	bl.displayName = "Block of Aluminum";
}

mods.tconstruct.Casting.removeBasinRecipe( block[blockTC] );

mods.tconstruct.Casting.addBasinRecipe(blockOutput, liquid * iliqBlock, null, false, 20);

blockOutput.displayName = "Block of Aluminum";

// ================ //
//  Ingot Handling  //
// ================ //

mods.witchinggadgets.InfernalBlastfurnace.removeRecipe( ingot[GC] );

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( cluster2 );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( dustRot );

mods.tconstruct.Casting.removeTableRecipe( ingot[GC] );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingot[IE] );

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
}

// =============== //
//  Dust Handling  //
// =============== //

dustOutput.displayName = "Pulverized Aluminum";

// Mek
mods.mekanism.Enrichment.removeRecipe( dustDirty );

mods.mekanism.Enrichment.addRecipe( dustDirty, dustOutput );

for item in oreOre.items {
	mods.mekanism.Enrichment.removeRecipe( item );
	mods.mekanism.Enrichment.addRecipe( item, dustOutput * 2 );	
}

mods.mekanism.Crusher.removeRecipe( dustIE );
for item in ingotOre.items {
	mods.mekanism.Crusher.addRecipe( item, dustOutput );
}

dustDirty.displayName = "Dirty Pulverized Aluminum";

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 8, oreDense, 14000, dustSecondary * 2, 0.20 );

mods.immersiveengineering.Crusher.removeRecipe( dustIE );

// mods.thermalexpansion.Pulverizer.removeRecipe( cluster2 );
// mods.thermalexpansion.Pulverizer.addRecipe( 4800, cluster2, dustOutput );

// AOBD
mods.thermalexpansion.Furnace.removeRecipe( dustAOBD );

furnace.addRecipe( ingotOutput, dustAOBD );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD, ingotOutput );


var orefull = [
	<GalacticraftCore:tile.gcBlockCore:7>
	,<GalacticraftMars:tile.asteroidsBlock:3>
	,oreOutput
] as IItemStack[];

for i, item in orefull {
	mods.railcraft.RockCrusher.removeRecipe( item );
	mods.railcraft.RockCrusher.addRecipe( item, false, false, [ dustOutput ], [ 100 ] );
}

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( ore[GC] );
	mods.magneticraft.Crusher.addRecipe( ore[GC], chunk, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( chunk );
	mods.magneticraft.Grinder.addRecipe( chunk, rubble, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( rubble );
	mods.magneticraft.Grinder.addRecipe( rubble, pebbles, dustOutput, 0.05, dustSecondary, 0.05 );

	mods.magneticraft.Sifter.removeRecipe( pebbles );
	mods.magneticraft.Sifter.addRecipe( pebbles, dustOutput * 3, dustSecondary, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( ingotOutput );
	mods.magneticraft.Grinder.addRecipe( ingotOutput, dustOutput, null, 0, null, 0 );
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

// ==================== //
//  Add Ingot Handling  //
// ==================== //

recipes.addShapeless( ingotOutput, [oreOre, <ore:dustPyrotheum>] );
furnace.addRecipe( ingotOutput, oreOre );
furnace.addRecipe( ingotOutput * 2, cluster );
furnace.addRecipe( ingotOutput * 2, cluster2 );
furnace.addRecipe( ingotOutput, dustOre );
furnace.addRecipe( ingotOutput, flakes );
furnace.addRecipe( ingotOutput, dustRot );

mods.witchinggadgets.InfernalBlastfurnace.addRecipe( ingotOutput * 3, cluster, 200, nuggetOutput, true );

mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, cluster2, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustRot, ingotOutput );

mods.tconstruct.Casting.addTableRecipe( ingotOutput, liquid * iliqIngot, <TConstruct:metalPattern>, false, 20);

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, dustOre, null, 100, 512, [] );

// ============== //
//  Ore Handling  //
// ============== //

mods.mekanism.Combiner.removeRecipe( ore[GC] );
mods.mekanism.Combiner.addRecipe( dustOutput * 8, oreOutput );
mods.mekanism.Combiner.addRecipe( dustIE * 8, oreOutput );

recipes.remove( ore[GC] );
recipes.addShaped( oreOutput * 6, [
	[ essence, essence, essence ],
	[ essence, null, essence ],
	[ essence, essence, essence ]
]);

MiningLaser.removeOre( ore[GC] );
MiningLaser.addOre( oreOutput.weight( weightMFR ) );
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
