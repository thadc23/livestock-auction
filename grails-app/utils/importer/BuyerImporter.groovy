package importer;

import auction.Buyer

public class BuyerImporter extends Importer<Buyer> {

	@Override
	public Buyer buildType(String[] data) {
		Buyer buyer = new Buyer();
		buyer.setName(data[0].trim());
		buyer.setStreetAddress(data[1].trim());
		buyer.setCity(data[2].trim());
		buyer.setState(data[3].trim());
		buyer.setZip(data[4].trim());
		buyer.setPhoneNumber(data[5].trim());
		buyer.setBuyerNumber(Integer.parseInt(data[6]));
		return buyer;
	}
}
