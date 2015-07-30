package auction;

public class Species {

	String name;
	double checkoffAmount;
	CheckoffType checkoffType;
	static hasMany = [animals:Animal];
	
	static constraints = {
		name(maxSize:20);
	}
	
	public String toString() {
		return name;
	}
}
