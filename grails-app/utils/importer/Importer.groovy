package importer;

import grails.validation.ValidationException
import interfaces.Importable

import org.apache.commons.lang.StringUtils

import exception.ImportException

public abstract class Importer<T> implements Importable {

	public void importFromFile(InputStream f) throws ImportException {
		def line;
		List<String> errors = new ArrayList<String>();
		Scanner s = new Scanner(f);
		List<String[]> columns = new ArrayList<String[]>();
		s.nextLine();
		while (s.hasNext()) {
			columns.add(s.nextLine().split(","));
		}
		List<T> objs = new ArrayList<T>();
		for (String[] array : columns) {
			line = array
			try {
				objs.add(buildType(array));
			} catch (Exception e) {
				errors.add(StringUtils.join(line, ", "))
			}
		}
		if(errors.size() > 0) {
			throw new ImportException("<br />" + StringUtils.join(errors, "<br />"));
		}
		def obj;
		try {
			for(T t : objs) {
				obj = t;
				t.save(failOnError: true);
			}
		} catch (Exception e) {
			throw new ImportException(obj.toString(), e);
		}
	}

	public abstract T buildType(String[] data);
}
