package rowbuilder;

public class AnimalRowBuilder extends RowBuilder{

	@Override
	public String startRow(Long id) {
		return "<tr id='animal" + id + "'>";
	}

	@Override
	public String createRemoveLink(Long id) {
		return "<td><a href=\"#\" class=\"removeAnimal\" onclick=\"removeAnimal(" + id + ");\">Remove</a></td>";
	}
	
	public String createField(String value, String columnName) {
		return "<td id=\"" + columnName + "\">" + value + "</td>";
	}
}
