package rowbuilder;

public class BuyerRowBuilder extends RowBuilder {

	@Override
	public String startRow(Long id) {
		return "<tr id='buyer" + id + "'>";
	}

	@Override
	public String createRemoveLink(Long id) {
		return "<td><a href=\"#\" class=\"removeBuyer\" onclick=\"removeBuyer(" + id + ");\">Remove</a></td>";
	}
	
	public String createTextField(Long id, double amount) {
		return "<td><input type=\"text\" id=\"amountDue" + id + "\" value=\"" + amount + "\" class=\"amountDueColumn amountDue\" onblur=\"updateTotal();\"/></td>";
	}
}
