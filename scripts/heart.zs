val blockStar = <ForbiddenMagic:StarBlock>;
val heartYellow = <TConstruct:heartCanister:3>;
val heartcanYellow = <TConstruct:heartCanister:4>;
val heartGreen = <TConstruct:heartCanister:5>;
val heartcanGreen = <TConstruct:heartCanister:6>;

recipes.addShaped( heartGreen, [
	[ blockStar, blockStar, blockStar ],
	[ blockStar, heartYellow, blockStar ],
	[ blockStar, blockStar, blockStar ]
]);

recipes.addShaped( heartcanGreen, [
	[ heartcanYellow, heartcanYellow, heartcanYellow ],
	[ heartcanYellow, heartGreen, heartcanYellow ],
	[ heartcanYellow, heartcanYellow, heartcanYellow ]
]);
