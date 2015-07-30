// Place your Spring DSL code here
beans = {
	importerServices(org.springframework.beans.factory.config.MapFactoryBean) {
		sourceMap = [
		"SELLERS":ref("sellerImporter"),
		"ANIMALS":ref("animalImporter"),
		"BUYERS":ref("buyerImporter"),
		"CHAMPIONS":ref("championImporter")
		]
	}
	buyerImporter(importer.BuyerImporter){}
	sellerImporter(importer.SellerImporter){}
	animalImporter(importer.AnimalImporter){}
	championImporter(importer.ChampionImporter){}
}