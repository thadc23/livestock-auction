package auction

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

class BuyerController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		//		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.max = 50
		if(params.isSearch) {
			String criteria = splitCriteria(params.searchCriteria)
			def buyerInstances = params.searchType.equals("all") ? Buyer.searchEvery(criteria, [reload: true]) : Buyer.searchEvery(criteria, [reload: true, properties: ["buyerNumber"]])
			if(buyerInstances) {
				[buyerInstanceList: buyerInstances, buyerInstanceTotal: buyerInstances.size, currentSearchType: params.searchType]
			} else {
				flash.message = "Buyer does not exist for given Criteria: " + params.searchCriteria;
				[buyerInstanceTotal: 0, currentSearchType: params.searchType]
			}
		} else {
			String searchType = StringUtils.isEmpty(params.searchType) ? "all" : params.searchType;
			[buyerInstanceList: Buyer.list(params), buyerInstanceTotal: Buyer.count(), currentSearchType: searchType]
		}
	}

	private String splitCriteria(String criteria) {
		String[] retVal = StringUtils.trim(criteria).split("[\\s]*[,]+[\\s]*");
		return retVal.length > 1 ? StringUtils.join(retVal, " OR ") : retVal[0];
	}

	def create = {
		def buyerInstance = new Buyer()
		buyerInstance.properties = params
		return [buyerInstance: buyerInstance]
	}

	def save = {
		def buyerInstance = new Buyer(params)
		if (buyerInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])}"
			redirect(action: "show", id: buyerInstance.id)
		}
		else {
			render(view: "create", model: [buyerInstance: buyerInstance])
		}
	}

	def show = {
		def buyerInstance = Buyer.get(params.id)
		if (!buyerInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
			redirect(action: "list")
		}
		else {
			[buyerInstance: buyerInstance]
		}
	}

	def edit = {
		def buyerInstance = Buyer.get(params.id)
		if (!buyerInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [buyerInstance: buyerInstance]
		}
	}

	def update = {
		def buyerInstance = Buyer.get(params.id)
		if (buyerInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (buyerInstance.version > version) {

					buyerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'buyer.label', default: 'Buyer')]
					as Object[], "Another user has updated this Buyer while you were editing")
					render(view: "edit", model: [buyerInstance: buyerInstance])
					return
				}
			}
			buyerInstance.properties = params
			if (!buyerInstance.hasErrors() && buyerInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'buyer.label', default: 'Buyer'), buyerInstance.id])}"
				redirect(action: "show", id: buyerInstance.id)
			}
			else {
				render(view: "edit", model: [buyerInstance: buyerInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def buyerInstance = Buyer.get(params.id)
		if (buyerInstance) {
			try {
				buyerInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'buyer.label', default: 'Buyer'), params.id])}"
			redirect(action: "list")
		}
	}

	def search = {
		params.isSearch = true;
		redirect(action: "list", params: params)
	}
	
	def reNumberBuyers = {
		List<Buyer> buyers = Buyer.list(sort:"buyerNumber", order:"asc")
		int i = 1;
		for(Buyer b : buyers) {
			b.setBuyerNumber(i);
			b.save(flush: true);
			i++;
		}
		render(view: "/reports/reports")
	}
}
