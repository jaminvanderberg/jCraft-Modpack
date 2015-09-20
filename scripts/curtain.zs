val curtain = <malisisdoors:item.curtain>;
val wool = <ore:blockWool>;

recipes.remove( curtain );
recipes.addShaped( curtain, [
	[ wool, wool, wool ],
	[ wool, wool, wool ],
	[ null, null, null ]
]);
