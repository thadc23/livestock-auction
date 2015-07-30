package interfaces;

import java.io.InputStream;

public interface Importable {

	public void importFromFile(InputStream f) throws Exception;
}
