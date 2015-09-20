val drac = <DraconicEvolution:draconiumIngot>;
val gold = <minecraft:gold_ingot>;
val star = <minecraft:nether_star>;
val emerald = <minecraft:emerald_block>;

val coreDrac = <DraconicEvolution:draconicCore>;
val coreWyv = <DraconicEvolution:wyvernCore>;

recipes.remove( coreDrac );
recipes.addShaped( coreDrac, [
	[ gold, drac, gold ],
	[ drac, star, drac ],
	[ gold, drac, gold ]
]);

recipes.remove( coreWyv );
recipes.addShaped( coreWyv, [
	[ drac, coreDrac, drac ],
	[ coreDrac, emerald, coreDrac ],
	[ drac, coreDrac, drac ]
]);


