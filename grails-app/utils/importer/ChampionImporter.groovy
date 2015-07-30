package importer;

import auction.Animal
import auction.Champion
import dao.AnimalDAO

public class ChampionImporter extends Importer<Champion> {

	@Override
	public Champion buildType(String[] data) {
		Champion champion = new Champion();
		champion.setName(data[1]);
		Animal animal = Animal.findByLotNumber(Integer.parseInt(data[0]));
		champion.setAnimal(animal);
		return champion;
	}
}
