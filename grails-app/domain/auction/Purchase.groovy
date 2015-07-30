package auction;

public class Purchase {

	Animal animal;
	Buyer buyer;
	double cost;
	
	static belongsTo = Animal;

	public Purchase(Animal animal, Buyer buyer, double cost) {
		this.animal = animal;
		this.buyer = buyer;
		this.cost = cost;
	}
	
	public Purchase() {
		super();
	}

}
