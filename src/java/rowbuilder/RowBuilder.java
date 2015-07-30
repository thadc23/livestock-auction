package rowbuilder;

public abstract class RowBuilder {

	public String endRow() {
		return "</tr>";
	}

	public String createField(String value, Long id, String columnName) {
		return "<td id=\"" + columnName + id + "\">" + value + "</td>";
	}
	
	public abstract String startRow(Long id);
	public abstract String createRemoveLink(Long id);
}
