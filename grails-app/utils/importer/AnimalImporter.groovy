package importer;

import auction.Animal
import auction.Seller
import auction.Species

public class AnimalImporter extends Importer<Animal> {

	@Override
	public Animal buildType(String[] data) {
		Animal animal = new Animal();
		animal.setLotNumber(Integer.parseInt(data[0]));
		animal.setTagNumber(data[1].trim());
		Species species = Species.findByName(data[2].trim().toUpperCase());
		animal.setSpecies(species);
		animal.setWeight(Integer.parseInt(data[3]));
		Seller seller = Seller.findByFirstNameAndLastName(data[4].trim().toUpperCase(), data[5].trim().toUpperCase());
		if(seller == null) {
			throw new RuntimeException();
		}
		animal.setSeller(seller);
		animal.setMarketBid(Double.parseDouble(data[6]));
		return animal;
	}
} 