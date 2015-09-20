import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var Mek = 0;
var IE = 1;
var RC = 2;
var Rot = 3;

var blockTC = 3;
// Blocks need not be in same order as ingots/ore
var block = [
	<Mekanism:BasicBlock:5>
	,<RotaryCraft:rotarycraft_block_deco:0>
	,<ImmersiveEngineering:storage:7>
	,<Railcraft:cube:2>
] as IItemStack[];

var ingotTC = RC;
var ingot = [
	<Mekanism:Ingot:4>
	,<ImmersiveEngineering:metal:7>
	,<Railcraft:ingot:0>
	,<RotaryCraft:rotarycraft_item_customingot:3>
] as IItemStack[];

var nuggetRC = 1;
var nuggetTC = 1;
// Nuggets need not be in same order as ingots/ore
var nugget = [
	<ImmersiveEngineering:metal:29>
	,<Railcraft:nugget:1>
] as IItemStack[];

val dustAOBD = <aobd:crushedSteel>;
val chunk = <aobd:chunkSteel>;
val rubble = <aobd:rubbleSteel>;
val pebbles = <aobd:pebblesSteel>;

// Intermediate States
val cluster = <aobd:clusterSteel>;
val dustOre = <ore:dustSteel>;
val oreOre = <ore:oreSteel>;
val nuggetOre = <ore:nuggetSteel>;
val ingotOre = <ore:ingotSteel>;
val liquid = <liquid:steel.molten>;
var iliqIngot = 144;
var iliqBlock = iliqIngot * 9;
val flakes = <RotaryCraft:rotarycraft_item_customextract:15>;
val minechem = <minechem:minechemElement:26>;
val minechem2 = <minechem:minechemElement:6>;

val ingotOutput = <TConstruct:materials:16>;
val blockOutput = <TConstruct:MetalBlock:9>;
val nuggetOutput = <TConstruct:materials:33>;
val oreOutput = <aobd:oreSteel>;
val dustOutput = <Mekanism:OtherDust:1>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;
val sand = <minecraft:sand>;
val cinnabar = <ThermalFoundation:material:20>;
val pyro = <ThermalFoundation:material:512>;
val netherrack = <minecraft:netherrack>;

val ore_ingotIron = <ore:ingotIron>;
val ingotIron = <minecraft:iron_ingot>;
val ore_dustIron = <ore:dustIron>;
val dustIron = <ThermalFoundation:material:0>;
val ore_dustCoal = <ore:dustCoal>;
val dustCoal = <ThermalFoundation:material:3>;
val ore_dustCoke = <ore:dustCoke>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
	
	if ( i != IE ) {
		furnace.remove( ing );
	}
}

recipes.remove( ingotOutput );
recipes.addShaped( ingotOutput, [
	[ nuggetOre, nuggetOre, nuggetOre ],
	[ nuggetOre, nuggetOre, nuggetOre ],
	[ nuggetOre, nuggetOre, nuggetOre ]
]);
recipes.addShapeless( nuggetOutput * 9, [ ingotOre ] );
recipes.addShaped( blockOutput, [
	[ ingotOre, ingotOre, ingotOre ],
	[ ingotOre, ingotOre, ingotOre ],
	[ ingotOre, ingotOre, ingotOre ]
]);
recipes.addShapeless( ingotOutput * 9, [ blockOutput ] );

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Steel";
}

mods.tconstruct.Casting.removeBasinRecipe( block[blockTC] );
mods.tconstruct.Casting.addBasinRecipe( blockOutput, liquid * iliqBlock, null, false, 20 );

blockOutput.displayName = "Block of Steel";

// ================ //
//  Ingot Handling  //
// ================ //

mods.witchinggadgets.InfernalBlastfurnace.removeRecipe( ingot[RC] );

mods.thermalexpansion.Furnace.removeRecipe( cluster );
mods.thermalexpansion.Furnace.removeRecipe( flakes );

mods.tconstruct.Casting.removeTableRecipe( ingot[ingotTC] );

mods.immersiveengineering.ArcFurnace.removeRecipe( ingot[IE] );
mods.immersiveengineering.ArcFurnace.removeRecipe( ingot[RC] );

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
}

mods.tconstruct.Casting.removeTableRecipe( nugget[nuggetTC] );
mods.tconstruct.Casting.addTableRecipe( nuggetOutput, liquid * iliqIngot, <TConstruct:metalPattern:27>, false, 20);

//

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
furnace.addRecipe( ingotOutput, dustAOBD );
furnace.addRecipe( ingotOutput * 2, cluster );
furnace.addRecipe( ingotOutput, dustOre );
furnace.addRecipe( ingotOutput, flakes );

//mods.thermalexpansion.Furnace.removeRecipe( oreOutput );
mods.thermalexpansion.Furnace.removeRecipe( dustOre );
mods.thermalexpansion.Furnace.removeRecipe( dustAOBD );

mods.witchinggadgets.InfernalBlastfurnace.addRecipe( ingotOutput, ore_ingotIron, 200, null, true );

mods.thermalexpansion.Furnace.addRecipe( 1600, oreOutput, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustAOBD, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, dustOutput, ingotOutput );
mods.thermalexpansion.Furnace.addRecipe( 1600, cluster, ingotOutput * 2 );
mods.thermalexpansion.Furnace.addRecipe( 1600, flakes, ingotOutput );

mods.tconstruct.Casting.addTableRecipe( ingotOutput, liquid * iliqIngot, <TConstruct:metalPattern>, false, 20);

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput * 2, oreOre, slag, 200,  512, [] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, dustOre, null, 100, 512, [] );

mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, ore_ingotIron, slag, 400,  512, [ ore_dustCoke ] );
mods.immersiveengineering.ArcFurnace.addRecipe( ingotOutput, ore_dustIron, slag, 400,  512, [ ore_dustCoke ] );

mods.thermalexpansion.Smelter.removeRecipe( oreOre, slagRich );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, slagRich, ingotOutput * 3, slag, 75 );
mods.thermalexpansion.Smelter.removeRecipe( oreOutput, sand );
mods.thermalexpansion.Smelter.addRecipe( 3200, oreOutput, sand, ingotOutput * 2, slagRich, 5 );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, cinnabar );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, cinnabar, ingotOutput * 3, ingotOutput, 100 );
mods.thermalexpansion.Smelter.removeRecipe( oreOre, pyro );
mods.thermalexpansion.Smelter.addRecipe( 4000, oreOutput, pyro, ingotOutput * 2, slagRich, 15 );

mods.thermalexpansion.Smelter.removeRecipe( dustOutput, sand );
mods.thermalexpansion.Smelter.addRecipe( 4000, dustOutput * 2, sand, ingotOutput * 2, slag, 25 );
mods.thermalexpansion.Smelter.removeRecipe( ore_dustCoal, dustOre );
mods.thermalexpansion.Smelter.removeRecipe( dustCoal, dustOutput );
mods.thermalexpansion.Smelter.addRecipe( 8000, dustCoal * 4, oreOutput, ingotOutput );
mods.thermalexpansion.Smelter.removeRecipe( ore_dustCoal, ore_dustIron );
mods.thermalexpansion.Smelter.removeRecipe( dustCoal, dustIron );
mods.thermalexpansion.Smelter.addRecipe( 8000, dustCoal * 4, dustIron, ingotOutput );
mods.thermalexpansion.Smelter.removeRecipe( ore_dustCoal, ore_ingotIron );
mods.thermalexpansion.Smelter.removeRecipe( dustCoal, ingotIron );
mods.thermalexpansion.Smelter.addRecipe( 8000, dustCoal * 4, ingotIron, ingotOutput );

//OutputStack
mods.immersiveengineering.BlastFurnace.removeRecipe( ingot[IE] );
//OutputStack, InputStack, Time in Ticks
mods.immersiveengineering.BlastFurnace.addRecipe( ingotOutput, ore_ingotIron, 1200);

mods.railcraft.BlastFurnace.removeRecipe( ingot[RC] );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:part.plate:0>, false, true, 1280, ingotOutput );
mods.railcraft.BlastFurnace.addRecipe( ingotIron, false, false, 1280, ingotOutput );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_helmet>, false, true, 1280 * 5, ingotOutput * 5 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_chestplate>, false, true, 1280 * 8, ingotOutput * 8 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_leggings>, false, true, 1280 * 7, ingotOutput * 7 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_boots>, false, true, 1280 * 4, ingotOutput * 4 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_horse_armor>, false, true, 1280 * 4, ingotOutput * 4 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_sword>, false, true, 1280 * 2, ingotOutput * 2 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_shovel>, false, true, 1280, ingotOutput );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_axe>, false, true, 1280 * 3, ingotOutput * 3 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:iron_hoe>, false, true, 1280 * 2, ingotOutput * 2 );
mods.railcraft.BlastFurnace.addRecipe( <minecraft:shears>, false, true, 1280 * 2, ingotOutput * 2 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.crowbar>, false, true, 1280 * 3, ingotOutput * 3 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:armor.steel.helmet>, false, true, 640 * 4, ingotOutput * 4 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:armor.steel.plate>, false, true, 640 * 6, ingotOutput * 6 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:armor.steel.legs>, false, true, 640 * 5, ingotOutput * 4 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:armor.steel.boots>, false, true, 640 * 3, ingotOutput * 3 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.steel.sword>, false, true, 640 * 1, ingotOutput * 1 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.steel.pickaxe>, false, true, 640 * 2, ingotOutput * 2 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.steel.hoe>, false, true, 640 * 1, ingotOutput * 1 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.steel.axe>, false, true, 640 * 2, ingotOutput * 2 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:tool.steel.shears>, false, true, 640 * 1, ingotOutput * 1 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:machine.beta:8>, false, true, 1280 * 12, ingotOutput * 12 );
mods.railcraft.BlastFurnace.addRecipe( <Railcraft:machine.beta:3>, false, true, 1280 * 2, ingotOutput * 2 );

// ====== //
//  Loot  //
// ====== //

vanilla.loot.addChestLoot( "villageBlacksmith", ingotOutput.weight( 10 ), 5, 9 );
vanilla.loot.removeChestLoot( "villageBlacksmith", ingot[RC] );

// ============== //
//  Ore Handling  //
// ============== //

MiningLaser.removeOre( oreOutput );

// ========== //
//  Minechem  //
// ========== //

for item in ingotOre.items {
	Synthesiser.removeRecipe( item );
}
for item in dustOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem, minechem2 ], ingotOutput, true, 300 );
Synthesiser.addRecipe( [ null, minechem, minechem2 ], dustOutput, true, 300 );
