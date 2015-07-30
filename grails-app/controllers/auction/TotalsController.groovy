package auction

import to.TotalsTO;

class TotalsController {

	def index() {
		List<Animal> animals = Animal.list();
		Map<String, TotalsTO> totalsTOs = new HashMap<String, TotalsTO>();
		for(Animal animal : animals) {
			if(animal.destination != null) {
				if(totalsTOs.get(animal.destination) == null) {
					TotalsTO to = new TotalsTO();
					to.setDestination(animal.destination);
					to.getSpeciesCount().put(animal.species, 1);
					totalsTOs.put(animal.destination, to);
				}
				else {
					TotalsTO to = totalsTOs.get(animal.destination);
					if(to.getSpeciesCount().get(animal.species) == null) {
						to.getSpeciesCount().put(animal.species, 1);
					} else {
						int i = to.getSpeciesCount().get(animal.species);
						i = i + 1;
						to.getSpeciesCount().put(animal.species, i);
					}
				}
			}
		}
		["totals" : totalsTOs.values()];
	}
}
