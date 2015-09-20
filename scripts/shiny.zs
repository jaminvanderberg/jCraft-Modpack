import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

var Rot = 0;

var ingot = [
	<RotaryCraft:rotarycraft_item_modingots:43>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:44>;

var ore = [
	null
] as IItemStack[];

val dustSecondary = <ThermalFoundation:material:36>;
val dustDirty = <aobd:dustDirtyPlatinum>;
val dustAOBD = <aobd:crushedPlatinum>;
val dustMC = <Magneticraft:item.dust_platinum>;
val chunk = <Magneticraft:item.chunk_platinum>;
val rubble = <Magneticraft:item.rubble_platinum>;
val pebbles = <Magneticraft:item.pebbles_platinum>;

// Intermediate States
val cluster = <WitchingGadgets:item.WG_Cluster:7>;
val dustOre = <ore:dustPlatinum>;
val oreOre = <ore:orePlatinum>;
val nuggetOre = <ore:nuggetPlatnium>;
val ingotOre = <ore:ingotPlatnum>;
val liquid = <liquid:platinum.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_modextracts:175>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:179>;
val oreNether = <NetherOres:tile.netherores.ore.1:0>;
val oreDense = <denseores:block0:13>;
val minechem = <minechem:minechemElement:78>;

val ingotOutput = <ThermalFoundation:material:69>;
val blockOutput = <ThermalFoundation:Storage:5>;
val nuggetOutput = <ThermalFoundation:material:101>;
val oreOutput = <ThermalFoundation:Ore:5>;
val dustOutput = <ThermalFoundation:material:37>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	furnace.remove( ing );
}

// ================ //
//  Block Handling  //
// ================ //

blockOutput.displayName = "Block of Shiny Metal";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );
mods.thermalexpansion.Furnace.removeRecipe( nflakes );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingotOutput );

// =============== //
//  Dust Handling  //
// =============== //

// Mek
dustDirty.displayName = "Dirty Pulverized Copper";

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
//furnace.addRecipe( ingotOutput, oreOre );
//furnace.addRecipe( ingotOutput * 2, cluster );
//furnace.addRecipe( ingotOutput, dustOre );
furnace.addRecipe( ingotOutput, flakes );
furnace.addRecipe( ingotOutput, nflakes );

//mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
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

Synthesiser.addRecipe( [ minechem * 16 ], ingotOutput, true, 300 );
Synthesiser.addRecipe( [ null, minechem * 16 ], dustOutput, true, 300 );
