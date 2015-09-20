import minetweaker.item.IItemStack;
import minetweaker.liquid.ILiquidStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var For = 0;
var Mek = 1;
var TC = 2;

var blockTC = 1;
// Blocks need not be in same order as ingots/ore
var block = [
	<Forestry:resourceStorage:3>
	,<Mekanism:BasicBlock:1>
	,<TConstruct:MetalBlock:4>
] as IItemStack[];

var ingot = [
	<Forestry:ingotBronze>
	,<Mekanism:Ingot:2>
	,<TConstruct:materials:13>
] as IItemStack[];
val ingotNether = <RotaryCraft:rotarycraft_item_modingots:35>;

// Nuggets need not be in same order as ingots/ore
var nugget = [
	<TConstruct:materials:31>
] as IItemStack[];

// Intermediate States
val dustOre = <ore:dustBronze>;
val nuggetOre = <ore:nuggetBronze>;
val ingotOre = <ore:ingotBronze>;
val crate = <Forestry:cratedBronze>;

val minechem = <minechem:minechemElement:29>;
val minechem2 = <minechem:minechemElement:50>;

val ingotOutput = <ThermalFoundation:material:73>;
val blockOutput = <ThermalFoundation:Storage:9>;
val nuggetOutput = <ThermalFoundation:material:105>;
val dustOutput = <ThermalFoundation:material:41>;
val slag = <ThermalExpansion:material:514>;
val slagRich = <ThermalExpansion:material:515>;

val tin = <ore:ingotTin>;
val copper = <ore:ingotCopper>;

// =========== //
//  Main Loop  //
// =========== //

for i, ing in ingot {
	recipes.remove( ing );
}

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Bronze";
}

blockOutput.displayName = "Block of Bronze";

// ================ //
//  Ingot Handling  //
// ================ //

mods.forestry.Carpenter.removeRecipe( ingot[For] );

// ================= //
//  Nugget Handling  //
// ================= //

for i, nug in nugget {
	recipes.remove( nug );
}

// ==================== //
//  Add Ingot Handling  //
// ==================== //

mods.forestry.Carpenter.addRecipe( 20, null, [
	crate, null, null,
	null, null, null,
	null, null, null
], null, ingotOutput * 9 );

mods.forestry.Carpenter.addRecipe( 20, null, [
	<Forestry:brokenBronzePickaxe>, null, null,
	null, null, null,
	null, null, null
], null, ingotOutput * 2 );

mods.forestry.Carpenter.addRecipe( 20, null, [
	<Forestry:brokenBronzeShovel>, null, null,
	null, null, null,
	null, null, null
], null, ingotOutput );

//OutputStack
mods.mekanism.Infuser.removeRecipe( ingot[Mek] );

for item in <ore:ingotCopper>.items {
//Metallurgic Infuser
//InfusionTypeString, InfusionAmount, InputStack, OutputStack (ValidInfusionTypes: CARBON, TIN, DIAMOND, REDSTONE, FUNGI, BIO, OBSIDIAN) 
	mods.mekanism.Infuser.addRecipe( "TIN", 20, item, ingotOutput );
}


recipes.addShapeless( ingotOutput * 4, [ tin, copper, copper, copper ] );

// ========== //
//  Minechem  //
// ========== //

for item in ingotOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem, minechem2 ], ingotOutput, true, 300 );
