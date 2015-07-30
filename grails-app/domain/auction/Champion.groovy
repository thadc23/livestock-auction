package auction

class Champion {
	Animal animal;
	String name;

    static constraints = {
    }
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Animal: " + this.animal.toString() + ", ");
		sb.append("Name: " + this.name);
		return sb.toString();
	}
}
