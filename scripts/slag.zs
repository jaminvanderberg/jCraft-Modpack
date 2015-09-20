val slag = <ore:itemSlag>;
val slagTE = <ThermalExpansion:material:514>;
slag.add( slagTE );

recipes.remove( <ImmersiveEngineering:stoneDecoration:4> );
recipes.addShaped( <ImmersiveEngineering:stoneDecoration:4>, [
	[ slag, <minecraft:clay_ball>, slag ],
	[ <minecraft:gravel>, slag, <minecraft:gravel> ],
	[ slag, <minecraft:clay_ball>, slag ]
]);


recipes.removeShapeless( <minecraft:clay_ball>, [ slagTE, slagTE, <minecraft:dirt>, <minecraft:water_bucket> ] );
recipes.addShapeless( <minecraft:clay_ball>, [ slag, slag, <minecraft:dirt>, <minecraft:water_bucket> ] );

recipes.removeShapeless( <ThermalExpansion:material:516>, [ <ore:dustWood>, <ore:dustWood>, <ore:dustSaltpeter>, slagTE ] );
recipes.addShapeless( <ThermalExpansion:material:516>, [ <ore:dustWood>, <ore:dustWood>, <ore:dustSaltpeter>, slag ] );
