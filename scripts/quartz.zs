import minetweaker.item.IItemStack;
import mods.minechem.Synthesiser;

var runMC = 1;

val dustIE = <ImmersiveEngineering:metal:8>;
val dustMC = <Magneticraft:item.dustQuartz>;
val ingotOutput = <minecraft:quartz>;
val oreOutput = <minecraft:quartz_ore>;
val dustOutput = <appliedenergistics2:item.ItemMultiMaterial:3>;

<ore:dustQuartz>.add( dustOutput );

// =============== //
//  Dust Handling  //
// =============== //

// IE
mods.immersiveengineering.Crusher.removeRecipe( dustIE );
mods.immersiveengineering.Crusher.addRecipe( dustOutput, ingotOutput, 4800, null, 0 );

// MC
if ( runMC > 0 ) {
	mods.magneticraft.Crusher.removeRecipe( oreOutput );
	mods.magneticraft.Crusher.addRecipe( oreOutput, ingotOutput * 2, ingotOutput, 0.4, dustOutput, 0.05 );

	mods.magneticraft.Grinder.removeRecipe( dustMC );
	mods.magneticraft.Grinder.addRecipe( ingotOutput, dustOutput, dustOutput, 0.5, null, 0 );
}
