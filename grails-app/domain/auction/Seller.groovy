package auction;

public class Seller {
	
	String firstName;
	String lastName;
	String streetAddress;
	String city;
	String state;
	String zip;
	String parentNames;
	String club;
	static searchable = true;
	static hasMany = [animals:Animal];
	
	static constraints = {
		firstName(maxSize:15, blank:false);
		lastName(maxSize:25, blank:false);
		streetAddress(maxSize:50, blank:false);
		city(maxSize:20, blank:false);
		state(maxSize:20, blank:false);
		zip(size:5..5, blank:false);
		parentNames(maxSize:75, blank:false);
		club(maxSize:30, blank:false);
	}
	
	public String toString() {
		return firstName + " " + lastName;
	}
}
