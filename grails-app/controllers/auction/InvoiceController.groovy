package auction

import org.apache.commons.lang.StringUtils;
import report.Reporter 
import rowbuilder.AnimalRowBuilder 
import rowbuilder.BuyerRowBuilder 


class InvoiceController {
	
	def getAnimal = {
		def animal
		def purchases
		def newRow = "No Match"
		def buyerRow = "";
		def buyerNums = "";
		def marketBid = ""
		def weight = 0
		def bid = 0;
		def dest = 0;
		if(params.tagNum) {
			try {
				animal = Animal.findByTagNumberAndSpecies(params.tagNum, Species.get(params.species));
				purchases = Purchase.findAllByAnimal(animal);
				if(animal) {
					def rowBuilder = new AnimalRowBuilder();
					newRow = rowBuilder.startRow(animal.id);
					newRow += rowBuilder.createRemoveLink(animal.id);
					newRow += rowBuilder.createField(animal.tagNumber.toString(), "tagNum");
					newRow += rowBuilder.createField(animal.seller.toString(), "seller");
					newRow += rowBuilder.createField(animal.weight.toString(), "weight");
					newRow += rowBuilder.endRow();
					marketBid = animal.marketBid.toString();
					weight = animal.weight;
					if(purchases) {
						bid = animal.pricePerPound;
						dest = animal.destination.id;
						for(Purchase p : purchases) {
							rowBuilder = new BuyerRowBuilder();
							def buyer = p.buyer;
							buyerRow += rowBuilder.startRow(Long.parseLong(buyer.buyerNumber.toString()));
							buyerRow += rowBuilder.createRemoveLink(Long.parseLong(buyer.buyerNumber.toString()));
							buyerRow += rowBuilder.createField(buyer.buyerNumber.toString(), Long.parseLong(buyer.buyerNumber.toString()), "buyerNum");
							buyerRow += rowBuilder.createField(buyer.name, Long.parseLong(buyer.buyerNumber.toString()), "buyerName");
							buyerRow += rowBuilder.createTextField(Long.parseLong(buyer.buyerNumber.toString()), p.cost);
							buyerRow += rowBuilder.endRow();
							buyerNums += p.buyer.buyerNumber + ",";
						}
					}
				}
			} catch (Exception ex) {
				ex.printStackTrace();
				newRow = "No Match"
			}
		}
		render(builder:'json') {
			element("newRow" : newRow, "marketBid" : marketBid, "weight" : weight, "buyerRow" : buyerRow, "buyerNums" : buyerNums, "bid" : bid, "dest" : dest);
		}
	}
	def getBuyer = {
		def newRow = "No Match"
		if(params.buyerNum) {
			def buyer
			try {
				buyer = Buyer.findByBuyerNumber(params.buyerNum);
				if(buyer) {
					def rowBuilder = new BuyerRowBuilder();
					newRow = rowBuilder.startRow(Long.parseLong(buyer.buyerNumber.toString()));
					newRow += rowBuilder.createRemoveLink(Long.parseLong(buyer.buyerNumber.toString()));
					newRow += rowBuilder.createField(buyer.buyerNumber.toString(), Long.parseLong(buyer.buyerNumber.toString()), "buyerNum");
					newRow += rowBuilder.createField(buyer.name, Long.parseLong(buyer.buyerNumber.toString()), "buyerName");
					newRow += rowBuilder.createTextField(Long.parseLong(buyer.buyerNumber.toString()), 0);
					newRow += rowBuilder.endRow();
				}
			} catch (Exception ex) {
				newRow = "No Match"
			}
		}
		render(builder:'json') {
			element("newRow" : newRow);
		}
	}
	def index = {
		[speciesId: params.species]
	}
	
	def create = {
		def animal = Animal.findByTagNumberAndSpecies(params.tagNum, Species.get(params.species));
		def dest = Destination.get(params.destination);
		def ppp = Double.parseDouble(params.pricePerPound);
		animal.destination = dest;
		animal.pricePerPound = ppp;
		animal.save(flush:true);
		def buyerNums = params.buyerNums.split(",");
		def buyerAmounts = params.buyerAmounts.split(",");
		def i = 0;
		def purchases = Purchase.findAllByAnimal(animal);
		if(purchases) {
			for(Purchase p : purchases) {
				p.delete(flush:true);
			}
		}
		for(String buyerNum : buyerNums) {
			if(StringUtils.isNotEmpty(buyerNum)) {
				Purchase p = new Purchase(animal, Buyer.findByBuyerNumber(buyerNum), Double.parseDouble(buyerAmounts[i]));
				p.save(flush:true);
			}
			i++;
		}
		redirect(action: "index", params: params);
	}
	
	def print = {
		String dir = grailsAttributes.getApplicationContext().getResource("/reports").getFile();
		def buyerNum = params.buyerNum;
		if(StringUtils.isNotEmpty(buyerNum)) {
			def buyer = Buyer.findByBuyerNumber(buyerNum);
			if(buyer) {
				def purcahses = Purchase.findAllByBuyer(buyer);
				if(purcahses) {
					Reporter r = new Reporter();
					r.printReport(Integer.parseInt(buyerNum), dir);
					buyer.paid = true;
					buyer.save(flush: true);
					render "success";
				} else {
					render "no purchases";
				}
			} else {
				render "no buyer number"
			}
		} else {
			render "failure"
		}
	}
}
