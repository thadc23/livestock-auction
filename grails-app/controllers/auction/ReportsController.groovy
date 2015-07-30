package auction

class ReportsController {

	def index() {
		redirect(action: "reports", params: params)
	}

	def reports() {
	}
}
