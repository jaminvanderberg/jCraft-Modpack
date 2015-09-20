import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var Rot = 0;
var TinkGrav = 0;

var ingot = [
	<RotaryCraft:rotarycraft_item_modingots:41>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:35>;

var ore = [
	<TConstruct:GravelOre:3>
] as IItemStack[];

var nuggetTC = 1;
var nuggetRC = 0;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<Railcraft:nugget:3>
	,<TConstruct:materials:21>
	,<Thaumcraft:ItemNugget:2>
] as IItemStack[];

val dustMek = <Mekanism:Dust:4>;
val dustDirty = <Mekanism:DirtyDust:4>;
val dustSecondary = <ThermalFoundation:material:0>;
val dustEIO = <EnderIO:itemPowderIngot:4>;
val dustAOBD = <aobd:crushedTin>;
val dustMC = <Magneticraft:item.dust_tin>;
val chunk = <Magneticraft:item.chunk_tin>;
val rubble = <Magneticraft:item.rubble_tin>;
val pebbles = <Magneticraft:item.pebbles_tin>;
val essence = <magicalcrops:magicalcrops_ModCropEssence:1>;
var colorMFR = 8;
var weightMFR = 85;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:18>;
val dustOre = <ore:dustTin>;
val oreOre = <ore:oreTin>;
val nuggetOre = <ore:nuggetTin>;
val ingotOre = <ore:ingotTin>;
val crate = <Forestry:cratedTin>;
val liquid = <liquid:tin.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:3>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:143>;
val oreberry = <TConstruct:oreBerries:3>;
val orePoor = <Railcraft:ore:10>;
val oreNether = <NetherOres:tile.netherores.ore.0:7>;
var oreNetherOutput = ore[GC];
val oreDense = <denseores:block0:9>;
val minechem = <minechem:minechemElement:50>;

val ingotOutput = <ThermalFoundation:material:65>;
val blockOutput = <ThermalFoundation:Storage:1>;
val nuggetOutput = <ThermalFoundation:material:97>;
val oreOutput = <ThermalFoundation:Ore:1>;
val dustOutput = <ThermalFoundation:material:33>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	
	if ( i != RC ) {
		furnace.remove( ing );
	}
	
	if ( i != GC & i != RC & i != Rot ) {
		mods.extraUtils.QED.removeRecipe( ing );
	}
	
	if ( i != RC ) {
		mods.extraUtils.QED.addShapedRecipe( ingotOutput * 3, [
			[ore[i], <minecraft:coal>, null],
			[null, null, null],
			[null, null, null]
		]);
	}
	
	if ( i != Rot & i != RC) {
		//NEI.hide( ore[i] );
	}
	
	//NEI.hide( ing );
}

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Tin";
}

mods.tconstruct.Casting.removeBasinRecipe( block[blockTC] );

mods.tconstruct.Casting.addBasinRecipe(blockOutput, liquid * iliqBlock, null, false, 20);

blockOutput.displayName = "Block of Tin";

// ================ //
//  Ingot Handling  //
// ================ //

mods.forestry.Carpenter.removeRecipe( ingot[For] );

mods.witchinggadgets.InfernalBlastfurnace.removeRecipe( ingot[GC] );

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );

mods.tconstruct.Casting.removeTableRecipe( ingot[GC] );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingotOutput );

//NEI.hide( ingotNether );

// ========== //
//  Squeezer  //
// ========== //

var can = [
	<Railcraft:fluid.creosote.can>
	,<Forestry:canEthanol>
	,<Forestry:canBiomass>
	,<Forestry:canHoney>
	,<Forestry:canIce>
	,<Forestry:canJuice>
	,<Forestry:canSeedOil>
	,<Forestry:canWater>
	,<Forestry:canLava>
	,<Forestry:canFuel>
	,<Forestry:canOil>
] as IItemStack[];

var fluid = [
	<liquid:creosote>
	,<liquid:bioethanol>
	,<liquid:biomass>
	,<liquid:for.honey>
	,<liquid:ice>
	,<liquid:juice>
	,<liquid:seedoil>
	,<liquid:water>
	,<liquid:lava>
	,<liquid:fuel>
	,<liquid:oil>
] as ILiquidStack[];

for i, c in can {
	mods.forestry.Squeezer.removeRecipe( fluid[i], [c] );
	mods.forestry.Squeezer.addRecipe( 4000, [c], fluid[i] * 1000, ingotOutput, 5 );	
}

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
	
	// NEI.hide( nug );
}

furnace.remove( nugget[nuggetTC] );
mods.thermalexpansion.Furnace.removeRecipe( oreberry );

furnace.addRecipe( nuggetOutput, oreberry );
mods.thermalexpansion.Furnace.addRecipe( 1600, oreberry, nuggetOutput );

furnace.remove( nugget[nuggetRC] );
mods.thermalexpansion.Furnace.removeRecipe( orePoor );

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

// AOBD
mods.thermalexpansion.Furnace.removeRecipe( dustAOBD );

furnace.addRecipe( ingotOutput, dustAOBD );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD, ingotOutput );
		
for item in oreOre.items {
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

	mods.magneticraft.Grinder.removeRecipe( ingot[GC] );
	mods.magneticraft.Grinder.addRecipe( ingot[GC], dustOutput, null, 0, null, 0 );
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
furnace.addRecipe( ingotOutput, dustOre );
furnace.addRecipe( ingotOutput, flakes );
furnace.addRecipe( ingotOutput, nflakes );

mods.forestry.Carpenter.addRecipe( 20, null, [
	crate, null, null,
	null, null, null,
	null, null, null
], null, ingotOutput * 9 );

mods.witchinggadgets.InfernalBlastfurnace.addRecipe( ingotOutput * 3, cluster, 200, nuggetOutput, true );

mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, nflakes, ingotOutput );

mods.tconstruct.Casting.addTableRecipe( ingotOutput, liquid * iliqIngot, <TConstruct:metalPattern>, false, 20);

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, dustOre, null, 100, 512, [] );

// ============== //
//  Ore Handling  //
// ============== //

mods.mekanism.Combiner.removeRecipe( ore[GC] );
mods.mekanism.Combiner.addRecipe( dustOutput * 8, oreOutput );
mods.mekanism.Combiner.addRecipe( dustMek * 8, oreOutput );
mods.mekanism.Combiner.addRecipe( dustEIO * 8, oreOutput );

recipes.remove( ore[GC] );
recipes.addShaped( oreOutput * 6, [
	[ essence, essence, essence ],
	[ essence, null, essence ],
	[ essence, essence, essence ]
]);

MiningLaser.removeOre( ore[GC] );
MiningLaser.addOre( oreOutput.weight(weightMFR) );
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

