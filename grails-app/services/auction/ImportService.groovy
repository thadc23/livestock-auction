package auction


import importer.Importer

import org.springframework.transaction.annotation.Transactional

import exception.ImportException

@Transactional
class ImportService {

	Map<String, Importer> importerServices = new HashMap<String, Importer>();

	def importStuff(type, file) throws ImportException{
		importerServices.get(type).importFromFile(file.getInputStream());
	}
}
