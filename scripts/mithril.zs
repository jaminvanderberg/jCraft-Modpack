import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 0;

var For = 0;
var GC = 1;
var Mek = 2;
var PR = 3;
var RC = 4;
var TC = 5;
var Rot = 6;
var TinkGrav = 6;

var ingot = [
	<RotaryCraft:rotarycraft_item_customingot:0>
] as IItemStack[];

val dustDirty = <aobd:dustDirtyMithril>;
var dustSecondary = null;
val dustEIO = <EnderIO:itemPowderIngot:4>;
val dustAOBD = <aobd:crushedMithril>;
val dustMC = <Magneticraft:item.dust_mithril>;
val chunk = <Magneticraft:item.chunk_mithril>;
val rubble = <Magneticraft:item.rubble_mithril>;
val pebbles = <Magneticraft:item.pebbles_mithril>;

// Intermediate States
val cluster = <WitchingGadgets:item.WG_Cluster:24>;
val dustOre = <ore:dustMithril>;
val oreOre = <ore:oreMithril>;
val nuggetOre = <ore:nuggetMithril>;
val ingotOre = <ore:ingotMithril>;
val crate = <Forestry:cratedTin>;
val liquid = <liquid:mithril.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_customextract:3>;
val oreNether = <NetherOres:tile.netherores.ore.1:7>;
val oreDense = <denseores:block0:14>;

val ingotOutput = <ThermalFoundation:material:70>;
val blockOutput = <ThermalFoundation:Storage:6>;
val nuggetOutput = <ThermalFoundation:material:102>;
val oreOutput = <ThermalFoundation:Ore:6>;
val dustOutput = <ThermalFoundation:material:38>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

ingotOutput.displayName = "Mithril Ingot";
blockOutput.displayName = "Block of Mithril";
nuggetOutput.displayName = "Mithril Nugget";
oreOutput.displayName = "Mithril Ore";
dustOutput.displayName = "Pulverized Mithril";
cluster.displayName = "Native Mithril Cluster";
oreDense.displayName = "Dense Mithril Ore";
<ThermalFoundation:material:134>.displayName = "Mithril Gear";

// =========== //
//  Main Loop  //
// =========== //

oreOre.add( ingot[0] );

for i, ing in ingot {
	recipes.remove( ing );
	furnace.remove( ing );
}

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( flakes );


// =============== //
//  Dust Handling  //
// =============== //

dustDirty.displayName = "Dirty Pulverized Mithril";

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

// ==================== //
//  Add Ingot Handling  //
// ==================== //

furnace.addRecipe( ingotOutput, flakes );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );
