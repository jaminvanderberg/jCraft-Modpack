import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

val dustMek = <Mekanism:Dust:1>;
val dustDirty = <Mekanism:DirtyDust:1>;
val dustIE = <ImmersiveEngineering:metal:9>;
val dustSecondary = <ThermalFoundation:material:20>;
val dustEIO = <EnderIO:itemPowderIngot:2>;
val dustAOBD = <aobd:crushedGold>;
val dustMC = <Magneticraft:item.dust_gold>;
val chunk = <Magneticraft:item.chunk_gold>;
val rubble = <Magneticraft:item.rubble_gold>;
val pebbles = <Magneticraft:item.pebbles_gold>;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:31>;
val dustOre = <ore:dustGold>;
val oreOre = <ore:oreGold>;
val nuggetOre = <ore:nuggetGold>;
val ingotOre = <ore:ingotGold>;
val liquid = <liquid:gold.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
//val flakes = <RotaryCraft:rotarycraft_item_modextracts:7>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:123>;
val oreberry = <TConstruct:oreBerries:1>;
val orePoor = <Railcraft:ore:8>;
val oreNether = <NetherOres:tile.netherores.ore.0:2>;
val oreDense = <denseores:block0:1>;
val minechem = <minechem:minechemElement:79>;

val ingotOutput = <minecraft:gold_ingot>;
val blockOutput = <minecraft:gold_block>;
val nuggetOutput = <minecraft:gold_nugget>;
val oreOutput = <minecraft:gold_ore>;
val dustOutput = <ThermalFoundation:material:1>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// ================= //
//  Nugget Handling  //
// ================= //

furnace.remove( nuggetOutput, orePoor );
mods.thermalexpansion.Furnace.removeRecipe( orePoor );

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

dustDirty.displayName = "Dirty Pulverized Gold";

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 8, oreDense, 14000, dustSecondary * 2, 0.20 );

mods.immersiveengineering.Crusher.removeRecipe( dustIE );

// AOBD
		
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

// ============= //
//  Arc Furnace  //
// ============= //

mods.immersiveengineering.ArcFurnace.removeRecipe( ingotOutput );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );

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
