package to;

import java.util.HashMap;
import java.util.Map;

import auction.Destination;
import auction.Species;

public class TotalsTO {

	private Destination destination;
	private Map<Species, Integer> speciesCount;
	
	public TotalsTO() {
		this.speciesCount = new HashMap<Species, Integer>();
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public Map<Species, Integer> getSpeciesCount() {
		return speciesCount;
	}

	public void setSpeciesCount(Map<Species, Integer> speciesCount) {
		this.speciesCount = speciesCount;
	}

}
