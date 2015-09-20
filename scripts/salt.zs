import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;
import mods.mfr.MiningLaser;

var runMC = 1;

var MC = 0;

// Blocks need not be in same order as ingots/ore
var block = [
	<Magneticraft:block_salt>
] as IItemStack[];

var ore = [
	<Magneticraft:salt_ore>
] as IItemStack[];

val dustMC = <Magneticraft:item.dustSalt>;
var colorMFR = 0;
var weightMFR = 100;

// Intermediate States
val cluster = <Thaumcraft:ItemNugget:17>;
val dustOre = <ore:dustSalt>;
val oreOre = <ore:oreSalt>;
val oreNether = <NetherOres:tile.netherores.ore.1:13>;
val minechem = <minechem:minechemElement:83>;

val blockOutput = <Mekanism:SaltBlock>;
val oreOutput = <Mekanism:Salt>;
val dustOutput = <Mekanism:Salt>;

// ================ //
//  Block Handling  //
// ================ //

for i, bl in block {
	recipes.remove( bl );
	bl.displayName = "Block of Salt";
}

blockOutput.displayName = "Block of Salt";

recipes.remove( blockOutput );
recipes.addShaped( blockOutput, [
	[ dustOre, dustOre ],
	[ dustOre, dustOre ]
]);

recipes.remove( dustMC );
recipes.addShapeless( dustOutput, [ blockOutput ] );

// =============== //
//  Dust Handling  //
// =============== //

mods.appeng.Grinder.removeRecipe( dustMC );
mods.appeng.Grinder.addRecipe( oreNether, dustOutput * 12, 4 );

mods.thermalexpansion.Pulverizer.removeRecipe( oreNether );
mods.thermalexpansion.Pulverizer.addRecipe( 3200, oreNether, dustOutput * 12, <minecraft:netherrack>, 15 );

mods.thermalexpansion.Pulverizer.removeRecipe( ore[MC] );
mods.thermalexpansion.Pulverizer.addRecipe( 4000, ore[MC], dustOutput * 2, null, 0 );

// IE
mods.immersiveengineering.Crusher.addRecipe( dustOutput * 2, oreOre, 6000, null, 0 );
mods.immersiveengineering.Crusher.removeRecipe( dustMC );

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( ore[MC] );
	mods.magneticraft.Crusher.addRecipe( ore[MC], dustOutput * 2, dustOutput, 0.4, null, 0 );
}


// ============== //
//  Ore Handling  //
// ============== //

MiningLaser.removeOre( ore[MC] );
MiningLaser.removeOre( oreNether );
MiningLaser.addOre( blockOutput.weight( weightMFR ) );
MiningLaser.addPreferredOre( colorMFR, blockOutput ); 

// ========== //
//  Minechem  //
// ========== //

for item in dustOre.items {
	Synthesiser.removeRecipe( item );
}

Synthesiser.addRecipe( [ minechem ], dustOutput, true, 300 );
Synthesiser.addRecipe( [ <minechem:minechemElement:11>, <minechem:minechemElement:13> ], dustOutput, true, 300 );
