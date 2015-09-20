import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

val dustDirty = <aobd:dustDirtyTungsten>;
val dustSecondary = <ThermalFoundation:material:0>;
val dustAOBD = <aobd:crushedTungsten>;
val dustMC = <Magneticraft:item.dust_tungsten>;
val chunk = <Magneticraft:item.chunk_tungsten>;
val rubble = <Magneticraft:item.rubble_tungsten>;
val pebbles = <Magneticraft:item.pebbles_tungsten>;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:16>;
val dustOre = <ore:dustTungsten>;
val oreOre = <ore:oreTungsten>;
val nuggetOre = <ore:nuggetTungsten>;
val ingotOre = <ore:ingotTungsten>;

val flakes = <RotaryCraft:rotarycraft_item_modextracts:87>;
val oreNether = <NetherOres:tile.netherores.ore.0:10>;

val minechem = <minechem:minechemElement:74>;

val ingotOutput = <Magneticraft:item.ingotTungsten>;
val blockOutput = <Magneticraft:block_tungsten>;
val nuggetOutput = <aobd:nuggetTungsten>;
val oreOutput = <Magneticraft:tungsten_ore>;
val dustOutput = <Magneticraft:item.dust_tungsten>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// =============== //
//  Dust Handling  //
// =============== //

dustOutput.displayName = "Pulverized Tungsten";
dustDirty.displayName = "Dirty Pulverized Tungsten";

// IE
mods.immersiveengineering.Crusher.removeRecipe( dustOutput );

mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );

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
