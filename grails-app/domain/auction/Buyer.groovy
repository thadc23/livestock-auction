package auction;

public class Buyer {
	
	String name;
	String streetAddress;
	String city;
	String state;
	String zip;
	String phoneNumber;
	int buyerNumber;
	boolean paid;
	static searchable = true;
	static hasMany = [purchases:Purchase];
	
	static constraints = {
		buyerNumber(unique:true);
		name(maxSize:75);
		streetAddress(maxSize:50);
		city(maxSize:20);
		state(maxSize:20);
		zip(size:5..5);
		phoneNumber();
	}
	
	public String toString() {
		return name;
	}
}
