package exception;

public class ImportException extends Exception {

	private static final long serialVersionUID = -7020938014463706301L;

	public ImportException(String message, Exception e) {
		super(message, e);
	}
	public ImportException(String message) {
		super(message);
	}

}
