import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

var IE = 0;
var Rot = 1;

// Blocks need not be in same order as ingots/ore
var block = [
	<ImmersiveEngineering:storage:4>
] as IItemStack[];

var ingot = [
	<ImmersiveEngineering:metal:4>
	,<RotaryCraft:rotarycraft_item_modingots:3>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:38>;

var ore = [
	<ImmersiveEngineering:ore:4>
	,null
] as IItemStack[];

var nuggetTC = 2;
var nuggetRC = 1;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<ImmersiveEngineering:metal:22>
	,<Railcraft:nugget:2>
	,<TConstruct:materials:20>
	,<Thaumcraft:ItemNugget:1>
] as IItemStack[];

val dustMek = <Mekanism:Dust:3>;
val dustDirty = <Mekanism:DirtyDust:3>;
val dustIE = <ImmersiveEngineering:metal:14>;
val dustSecondary = <ThermalFoundation:material:37>;
val dustAOBD = <aobd:crushedNickel>;
val dustMC = <Magneticraft:item.dust_nickel>;
val chunk = <Magneticraft:item.chunk_nickel>;
val rubble = <Magneticraft:item.rubble_nickel>;
val pebbles = <Magneticraft:item.pebbles_nickel>;
val minechem = <minechem:minechemElement:28>;

// Intermediate States
val cluster = <WitchingGadgets:item.WG_Cluster:3>;
val dustOre = <ore:dustNickel>;
val oreOre = <ore:oreNickel>;
val nuggetOre = <ore:nuggetNickel>;
val ingotOre = <ore:ingotNickel>;
val liquid = <liquid:nickel.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:15>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:155>;
val oreNether = <NetherOres:tile.netherores.ore.1:1>;
val oreDense = <denseores:block0:12>;

val ingotOutput = <ThermalFoundation:material:68>;
val blockOutput = <ThermalFoundation:Storage:4>;
val nuggetOutput = <ThermalFoundation:material:100>;
val oreOutput = <ThermalFoundation:Ore:4>;
val dustOutput = <ThermalFoundation:material:36>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	furnace.remove( ing );
	
	if ( i != Rot ) {
		mods.extraUtils.QED.removeRecipe( ing );
	}
	
	if ( i != Rot ) {
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
	bl.displayName = "Block of Ferrous Metal";
}

blockOutput.displayName = "Block of Ferrous Metal";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );

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

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 8, oreDense, 14000, dustSecondary * 2, 0.20 );

mods.immersiveengineering.Crusher.removeRecipe( dustIE );

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

mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, nflakes, ingotOutput );

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

Synthesiser.addRecipe( [ minechem ], ingotOutput, true, 300 );
Synthesiser.addRecipe( [ null, minechem ], dustOutput, true, 300 );


