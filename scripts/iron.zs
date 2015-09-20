import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

var nuggetTC = 2;
var nuggetRC = 1;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<ImmersiveEngineering:metal:21>
	,<Railcraft:nugget:0>
	,<TConstruct:materials:19>
	,<Thaumcraft:ItemNugget:0>
] as IItemStack[];

val dustMek = <Mekanism:Dust:0>;
val dustDirty = <Mekanism:DirtyDust:0>;
val dustIE = <ImmersiveEngineering:metal:8>;
val dustSecondary = <ThermalFoundation:material:36>;
val dustEIO = <EnderIO:itemPowderIngot:1>;
val dustAOBD = <aobd:crushedIron>;
val dustMC = <Magneticraft:item.dust_iron>;
val chunk = <Magneticraft:item.chunk_iron>;
val rubble = <Magneticraft:item.rubble_iron>;
val pebbles = <Magneticraft:item.pebbles_iron>;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:16>;
val dustOre = <ore:dustIron>;
val oreOre = <ore:oreIron>;
val nuggetOre = <ore:nuggetIron>;
val ingotOre = <ore:ingotIron>;
val liquid = <liquid:iron.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
//val flakes = <RotaryCraft:rotarycraft_item_modextracts:7>;
val nflakes = <RotaryCraft:rotarycraft_item_modextracts:119>;
val oreberry = <TConstruct:oreBerries:0>;
val orePoor = <Railcraft:ore:7>;
val oreNether = <NetherOres:tile.netherores.ore.0:3>;
val oreDense = <denseores:block0:0>;
val minechem = <minechem:minechemElement:26>;

val ingotOutput = <minecraft:iron_ingot>;
val blockOutput = <minecraft:iron_block>;
val nuggetOutput = <ThermalFoundation:material:8>;
val oreOutput = <minecraft:iron_ore>;
val dustOutput = <ThermalFoundation:material:0>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
}

furnace.remove( nugget[nuggetRC] );
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

dustDirty.displayName = "Dirty Pulverized Iron";

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOre, 3600, null, 0 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 4, oreNether, 6000, dustSecondary, 0.10 );
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 8, oreDense, 14000, dustSecondary * 2, 0.20 );

mods.immersiveengineering.Crusher.removeRecipe( dustIE );

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
