import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

var IE = 0;
var PR = 1;
var Rea = 2;
var Rot = 3;
var RotC = 4;

// Blocks need not be in same order as ingots/ore
var block = [
	<ImmersiveEngineering:storage:3>
	,<ProjRed|Exploration:projectred.exploration.stone:10>
] as IItemStack[];

var ingot = [
	<ImmersiveEngineering:metal:3>
	,<ProjRed|Core:projectred.core.part:54>
	,<ReactorCraft:reactorcraft_item_ingots:3>
	,<RotaryCraft:rotarycraft_item_modingots:4>
	,<RotaryCraft:rotarycraft_item_compacts:7>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:36>;

var ore = [
	<ImmersiveEngineering:ore:3>
	,<ProjRed|Exploration:projectred.exploration.ore:5>
	,<ReactorCraft:reactorcraft_block_ore:4>
	,null
	,null
] as IItemStack[];

var nuggetTC = 1;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<ImmersiveEngineering:metal:25>
	,<Thaumcraft:ItemNugget:3>
] as IItemStack[];

val dustMek = <Mekanism:Dust:5>;
val dustDirty = <Mekanism:DirtyDust:5>;
val dustIE = <ImmersiveEngineering:metal:13>;
val dustSecondary = <ThermalFoundation:material:35>;
//val dustEIO = <EnderIO:itemPowderIngot:3>;
val dustAOBD = <aobd:crushedSilver>;
val dustMC = <Magneticraft:item.dust_silver>;
val chunk = <Magneticraft:item.chunk_silver>;
val rubble = <Magneticraft:item.rubble_silver>;
val pebbles = <Magneticraft:item.pebbles_silver>;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:19>;
val dustOre = <ore:dustSilver>;
val oreOre = <ore:oreSilver>;
val nuggetOre = <ore:nuggetSilver>;
val ingotOre = <ore:ingotSilver>;
val liquid = <liquid:silver.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:19>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:159>;
val flakes2 = <RotaryCraft:rotarycraft_item_extracts:32>;
val oreNether = <NetherOres:tile.netherores.ore.0:9>;
val oreDense = <denseores:block0:10>;
val minechem = <minechem:minechemElement:29>;

val ingotOutput = <ThermalFoundation:material:66>;
val blockOutput = <ThermalFoundation:Storage:2>;
val nuggetOutput = <ThermalFoundation:material:98>;
val oreOutput = <ThermalFoundation:Ore:2>;
val dustOutput = <ThermalFoundation:material:34>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

blockOutput.displayName = "Block of Silver";

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	furnace.remove( ing );
	
	if ( i != Rot & i != RotC ) {
		mods.extraUtils.QED.removeRecipe( ing );
	}
	
	if ( i != Rot & i != RotC ) {
		mods.extraUtils.QED.addShapedRecipe( ingotOutput * 3, [
			[ore[i], <minecraft:coal>, null],
			[null, null, null],
			[null, null, null]
		]);
	}
}

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Silver";
}

blockOutput.displayName = "Block of Silver";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );
mods.thermalexpansion.Furnace.removeRecipe( flakes2 );

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

// Mek

mods.mekanism.Enrichment.removeRecipe( dustDirty );

mods.mekanism.Enrichment.addRecipe( dustDirty, dustOutput );

for item in oreOre.items {
	mods.mekanism.Enrichment.removeRecipe( item );
	mods.mekanism.Enrichment.addRecipe( item, dustOutput * 2 );	
}

mods.mekanism.Crusher.removeRecipe( dustMek );
for item in ingotOre.items {
	mods.mekanism.Crusher.addRecipe( item, dustOutput );
}

dustDirty.displayName = "Dirty Pulverized Silver";

// IE

mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 8, oreDense, 14000, dustSecondary * 2, 0.20 );

mods.immersiveengineering.Crusher.removeRecipe( dustIE );

// AOBD
mods.thermalexpansion.Furnace.removeRecipe( dustAOBD );

furnace.addRecipe( ingotOutput, dustAOBD );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD, ingotOutput );
		
for item in oreOre.items {
	mods.railcraft.RockCrusher.removeRecipe( item );
	mods.railcraft.RockCrusher.addRecipe( item, false, false, [ dustOutput * 2 ], [ 100 ] );
}

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( oreOutput );
	mods.magneticraft.Crusher.addRecipe( oreOutput, chunk, dustOutput, 0.05, dustSecondary, 0.05 );

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

//recipes.addShapeless( ingotOutput, [oreOre, <ore:dustPyrotheum>] );
furnace.addRecipe( ingotOutput, oreOre );
//furnace.addRecipe( ingotOutput * 2, cluster );
furnace.addRecipe( ingotOutput, dustOre );
furnace.addRecipe( ingotOutput, flakes );
furnace.addRecipe( ingotOutput, nflakes );
furnace.addRecipe( ingotOutput, flakes2 );

mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, nflakes, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes2, ingotOutput );

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, dustOre, null, 100, 512, [] );

// ========== //
//  Minechem  //
// ========== //

for item in ingotOre.items {
	Synthesiser.removeRecipe( item );
}
for item in dustOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem * 16 ], ingotOutput, true, 300 );
Synthesiser.addRecipe( [ null, minechem * 16 ], dustOutput, true, 300 );


