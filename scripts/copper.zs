import minetweaker.item.IItemStack;import mods.minechem.Synthesiser;import mods.mfr.MiningLaser;var runMC = 1;var For=0;var GC=1;var Mek=2;var IE=3;var PR=4;var RC=5;var TC=6;var Rot=7;var TinkGrav=7;var Thaum=7;var MC=8;var blockTC=1;var block=[<Forestry:resourceStorage:1>,<GalacticraftCore:tile.gcBlockCore:9>,<Mekanism:BasicBlock:12>,<ImmersiveEngineering:storage:0>,<ProjRed|Exploration:projectred.exploration.stone:8>,<Railcraft:cube:9>,<TConstruct:MetalBlock:3>,<Magneticraft:block_copper>]as IItemStack[];var ingot=[<Forestry:ingotCopper>,<GalacticraftCore:item.basicItem:3>,<Mekanism:Ingot:5>,<ImmersiveEngineering:metal:0>,<ProjRed|Core:projectred.core.part:52>,<Railcraft:ingot:1>,<TConstruct:materials:9>,<RotaryCraft:rotarycraft_item_modingots:1>,<Magneticraft:item.ingotCopper>]as IItemStack[];val ingotNether=<RotaryCraft:rotarycraft_item_modingots:36>;var ore=[<Forestry:resources:1>,<GalacticraftCore:tile.gcBlockCore:5>,<Mekanism:OreBlock:1>,<ImmersiveEngineering:ore:0>,<ProjRed|Exploration:projectred.exploration.ore:3>,null,<TConstruct:SearedBrick:3>,<TConstruct:GravelOre:2>,<Magneticraft:copper_ore>]as IItemStack[];var nuggetTC=2;var nuggetRC=1;var nugget=[<ImmersiveEngineering:metal:22>,<Railcraft:nugget:2>,<TConstruct:materials:20>,<Thaumcraft:ItemNugget:1>]as IItemStack[];val dustMek=<Mekanism:Dust:3>;val dustDirty=<Mekanism:DirtyDust:3>;val dustIE=<ImmersiveEngineering:metal:10>;val dustSecondary=<ThermalFoundation:material:1>;val dustEIO=<EnderIO:itemPowderIngot:3>;val dustAOBD=<aobd:crushedCopper>;val dustMC=<Magneticraft:item.dust_copper>;val chunk=<Magneticraft:item.chunk_copper>;val rubble=<Magneticraft:item.rubble_copper>;val pebbles=<Magneticraft:item.pebbles_copper>;val essence=<magicalcrops:magicalcrops_ModCropEssence:0>;var colorMFR=1;var weightMFR=90;val cluster=<Thaumcraft:ItemNugget:17>;val dustOre=<ore:dustCopper>;val oreOre=<ore:oreCopper>;val nuggetOre=<ore:nuggetCopper>;val ingotOre=<ore:ingotCopper>;val crate=<Forestry:cratedCopper>;val liquid=<liquid:copper.molten>;var iliqIngot=144;var iliqBlock=iliqIngot*9;val flakes=<RotaryCraft:rotarycraft_item_modextracts:7>;val nflakes=<RotaryCraft:rotarycraft_item_modextracts:147>;val oreberry=<TConstruct:oreBerries:2>;val orePoor=<Railcraft:ore:9>;val oreNether=<NetherOres:tile.netherores.ore.0:6>;var oreNetherOutput=ore[GC];val oreDense=<denseores:block0:8>;val minechem=<minechem:minechemElement:29>;val ingotOutput=<ThermalFoundation:material:64>;val blockOutput=<ThermalFoundation:Storage:0>;val nuggetOutput=<ThermalFoundation:material:96>;val oreOutput=<ThermalFoundation:Ore:0>;val dustOutput=<ThermalFoundation:material:32>;val slag=<ThermalExpansion:material:514>;val slagRich=<ThermalExpansion:material:515>;for i,ing in ingot{recipes.remove(ing);if(i!=RC){furnace.remove(ing);}
if(i!=GC&i!=RC&i!=Rot){mods.extraUtils.QED.removeRecipe(ing);}
if(i!=RC){mods.extraUtils.QED.addShapedRecipe(ingotOutput*3,[[ore[i],<minecraft:coal>,null],[null,null,null],[null,null,null]]);}}
for i,bl in block{recipes.remove(bl);bl.displayName="Block of Copper";}
mods.tconstruct.Casting.removeBasinRecipe(block[blockTC]);mods.tconstruct.Casting.addBasinRecipe(blockOutput,liquid*iliqBlock,null,false,20);blockOutput.displayName="Block of Copper";mods.forestry.Carpenter.removeRecipe(ingot[For]);mods.witchinggadgets.InfernalBlastfurnace.removeRecipe(ingot[GC]);mods.thermalexpansion.Furnace.removeRecipe(cluster);mods.thermalexpansion.Furnace.removeRecipe(flakes);mods.thermalexpansion.Furnace.removeRecipe(nflakes);mods.tconstruct.Casting.removeTableRecipe(ingot[GC]);mods.immersiveengineering.ArcFurnace.removeRecipe(ingot[IE]);for i,nug in nugget{recipes.remove(nug);}
furnace.remove(nugget[nuggetTC]);mods.thermalexpansion.Furnace.removeRecipe(oreberry);furnace.addRecipe(nuggetOutput,oreberry);mods.thermalexpansion.Furnace.addRecipe(1600,oreberry,nuggetOutput);furnace.remove(nugget[nuggetRC]);mods.thermalexpansion.Furnace.removeRecipe(orePoor);furnace.remove(oreNetherOutput);furnace.addRecipe(oreOutput*2,oreNether);mods.thermalexpansion.Furnace.removeRecipe(oreNether);mods.thermalexpansion.Furnace.addRecipe(1600,oreNether,oreOutput*2);mods.thermalexpansion.Smelter.removeRecipe(oreNether,<minecraft:sand>);mods.thermalexpansion.Smelter.addRecipe(3200,oreNether,<minecraft:sand>,oreOutput*2,slagRich,10);mods.thermalexpansion.Smelter.removeRecipe(oreNether,slagRich);mods.thermalexpansion.Smelter.addRecipe(7200,oreNether,slagRich,oreOutput*3,slag,100);mods.mekanism.Enrichment.removeRecipe(dustDirty);mods.mekanism.Enrichment.addRecipe(dustDirty,dustOutput);for item in oreOre.items{mods.mekanism.Enrichment.removeRecipe(item);mods.mekanism.Enrichment.addRecipe(item,dustOutput*2);}
mods.mekanism.Crusher.removeRecipe(dustMek);for item in ingotOre.items{mods.mekanism.Crusher.addRecipe(item,dustOutput);}
dustDirty.displayName="Dirty Pulverized Copper";mods.immersiveengineering.Crusher.addRecipe(dustOutput,ingotOre,3600,null,0);mods.immersiveengineering.Crusher.addRecipe(dustOutput*2,oreOre,6000,dustSecondary,0.10);mods.immersiveengineering.Crusher.addRecipe(dustOutput*4,oreNether,6000,dustSecondary,0.10);mods.immersiveengineering.Crusher.addRecipe(dustOutput*8,oreDense,14000,dustSecondary*2,0.20);mods.immersiveengineering.Crusher.removeRecipe(dustIE);mods.thermalexpansion.Furnace.removeRecipe(dustAOBD);furnace.addRecipe(ingotOutput,dustAOBD);mods.thermalexpansion.Furnace.addRecipe(1600,dustAOBD,ingotOutput);for item in oreOre.items{mods.railcraft.RockCrusher.removeRecipe(item);mods.railcraft.RockCrusher.addRecipe(item,false,false,[dustOutput*2],[100]);}
if(runMC>0){mods.magneticraft.Crusher.removeRecipe(ore[GC]);mods.magneticraft.Crusher.addRecipe(ore[GC],chunk,dustOutput,0.05,dustSecondary,0.05);mods.magneticraft.Grinder.removeRecipe(chunk);mods.magneticraft.Grinder.addRecipe(chunk,rubble,dustOutput,0.05,dustSecondary,0.05);mods.magneticraft.Grinder.removeRecipe(rubble);mods.magneticraft.Grinder.addRecipe(rubble,pebbles,dustOutput,0.05,dustSecondary,0.05);mods.magneticraft.Sifter.removeRecipe(pebbles);mods.magneticraft.Sifter.addRecipe(pebbles,dustOutput*3,dustSecondary,0.05);mods.magneticraft.Grinder.removeRecipe(ingot[MC]);mods.magneticraft.Grinder.addRecipe(ingot[MC],dustOutput,null,0,null,0);}
mods.thermalexpansion.Furnace.removeRecipe(chunk);mods.thermalexpansion.Furnace.removeRecipe(rubble);mods.thermalexpansion.Furnace.removeRecipe(pebbles);furnace.addRecipe(ingotOutput*2,chunk);furnace.addRecipe(ingotOutput*2,rubble);furnace.addRecipe(ingotOutput*2,pebbles);mods.thermalexpansion.Furnace.addRecipe(1600,chunk,ingotOutput*2);mods.thermalexpansion.Furnace.addRecipe(1600,rubble,ingotOutput*2);mods.thermalexpansion.Furnace.addRecipe(1600,pebbles,ingotOutput*2);recipes.addShapeless(ingotOutput,[oreOre,<ore:dustPyrotheum>]);furnace.addRecipe(ingotOutput,oreOre);furnace.addRecipe(ingotOutput*2,cluster);furnace.addRecipe(ingotOutput,dustOre);furnace.addRecipe(ingotOutput,flakes);furnace.addRecipe(ingotOutput,nflakes);mods.forestry.Carpenter.addRecipe(20,null,[crate,null,null,null,null,null,null,null,null],null,ingotOutput*9);mods.witchinggadgets.InfernalBlastfurnace.addRecipe(ingotOutput*3,cluster,200,nuggetOutput,true);mods.thermalexpansion.Furnace.addRecipe(1600,cluster,ingotOutput*2);mods.thermalexpansion.Furnace.addRecipe(1600,flakes,ingotOutput);mods.thermalexpansion.Furnace.addRecipe(1600,nflakes,ingotOutput);mods.tconstruct.Casting.addTableRecipe(ingotOutput,liquid*iliqIngot,<TConstruct:metalPattern>,false,20);mods.immersiveengineering.ArcFurnace.addRecipe(ingotOutput*2,oreOre,slag,200,512,[]);mods.immersiveengineering.ArcFurnace.addRecipe(ingotOutput,dustOre,null,100,512,[]);mods.mekanism.Combiner.removeRecipe(ore[GC]);mods.mekanism.Combiner.addRecipe(dustOutput*8,oreOutput);mods.mekanism.Combiner.addRecipe(dustMek*8,oreOutput);mods.mekanism.Combiner.addRecipe(dustIE*8,oreOutput);mods.mekanism.Combiner.addRecipe(dustEIO*8,oreOutput);recipes.remove(ore[GC]);recipes.addShaped(oreOutput*6,[[essence,essence,essence],[essence,null,essence],[essence,essence,essence]]);MiningLaser.removeOre(ore[GC]);MiningLaser.addOre(oreOutput.weight(weightMFR));MiningLaser.addPreferredOre(colorMFR,oreOutput);for item in ingotOre.items{Synthesiser.removeRecipe(item);}
for item in dustOre.items{Synthesiser.removeRecipe(item);}
Synthesiser.addRecipe([minechem * 16],ingotOutput,true,300);Synthesiser.addRecipe([null,minechem * 16],dustOutput,true,300);
