package importer;

import auction.Seller

public class SellerImporter extends Importer<Seller> {
	@Override
	public Seller buildType(String[] data) {
		Seller seller = new Seller();
		seller.setFirstName(data[0].trim().toUpperCase());
		seller.setLastName(data[1].trim().toUpperCase());
		seller.setStreetAddress(data[2]);
		seller.setCity(data[3]);
		seller.setState(data[4]);
		seller.setZip(data[5]);
		seller.setParentNames(data[6]);
		seller.setClub(data[7]);
		return seller;
	}
}
