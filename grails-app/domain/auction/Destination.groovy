package auction;

public class Destination {
	
	String name;
	static hasMany = [animals:Animal];
	
	static constraints = {
		name(maxSize:30);
	}
	
	public String toString() {
		return name;
	}
	
}
