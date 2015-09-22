import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 0;


var ingot = [
	<RotaryCraft:rotarycraft_item_modingots:42>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:35>;

val dustDirty = <aobd:dustDirtyArdite>;
val dustSecondary = <ThermalFoundation:material:1>;
val dustAOBD = <aobd:crushedArdite>;
val cluster = <WitchingGadgets:item.WG_Cluster:2>;
val dustMC = <Magneticraft:item.dust_ardite>;
val chunk = <Magneticraft:item.chunk_ardite>;
val rubble = <Magneticraft:item.rubble_ardite>;
val pebbles = <Magneticraft:item.pebbles_ardite>;
val essence = <magicalcrops:magicalcrops_ModCropEssence:11>;

// Intermediate States
val dustOre = <ore:dustArdite>;
val oreOre = <ore:oreArdite>;
val nuggetOre = <ore:nuggetArdite>;
val ingotOre = <ore:ingotArdite>;

val flakes = <RotaryCraft:rotarycraft_item_modextracts:171>;
val minechem = <minechem:minechemElement:18>;

val ingotOutput = <TConstruct:materials:4>;
val blockOutput = <TConstruct:MetalBlock:1>;
val nuggetOutput = <TConstruct:materials:29>;
val oreOutput = <TConstruct:SearedBrick:2>;
val dustOutput = <TConstruct:materials:38>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	furnace.remove( ing );
}

// ================ //
//  Block Handling  //
// ================ //

blockOutput.displayName = "Block of Ardite";

// ================ //
//  Ingot Handling  //
// ================ //

mods.thermalexpansion.Furnace.removeRecipe( flakes );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingotOutput );


// =============== //
//  Dust Handling  //
// =============== //

dustOutput.displayName = "Pulverized Ardite";
dustDirty.displayName = "Dirty Pulverizer Ardite";

// AOBD
		
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
