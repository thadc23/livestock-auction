package auction

import exception.ImportException



class ImportController {

	def importService

	def importObject = {
		def file = params.myFile;
		try {
			importService.importStuff(params.type, file);
			flash.message = "Import Successful";
		} catch (ImportException e) {
			e.printStackTrace();
			flash.message = "Failed because of " + e.getMessage();
		} finally {
			redirect(action: "index");
		}
	}

	def index = {
	}
}
