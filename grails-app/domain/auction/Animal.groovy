package auction;

public class Animal {

	String tagNumber;
	int weight;
	Seller seller;
	Species species;
	Destination destination;
	int lotNumber;
	double marketBid = 0;
	double pricePerPound = 0;
	
	static searchable = true
	static belongsTo = [species:Species, seller:Seller, destination:Destination];
	static hasMany = [purchases:Purchase];
	
	static constraints = {
		tagNumber(blank:false);
		weight();
		lotNumber(nullable:true);
		destination(nullable:true);
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Tag #: " + tagNumber + ", ");
		sb.append("Weight: " + weight + ", ");
		sb.append("Seller: " + seller);
		return sb.toString();
	}
}
