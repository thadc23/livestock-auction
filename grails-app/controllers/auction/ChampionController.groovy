package auction

class ChampionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [championInstanceList: Champion.list(params), championInstanceTotal: Champion.count()]
    }

    def create = {
        def championInstance = new Champion()
        championInstance.properties = params
        return [championInstance: championInstance]
    }

    def save = {
        def championInstance = new Champion(params)
        if (championInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'champion.label', default: 'Champion'), championInstance.id])}"
            redirect(action: "show", id: championInstance.id)
        }
        else {
            render(view: "create", model: [championInstance: championInstance])
        }
    }

    def show = {
        def championInstance = Champion.get(params.id)
        if (!championInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [championInstance: championInstance]
        }
    }

    def edit = {
        def championInstance = Champion.get(params.id)
        if (!championInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [championInstance: championInstance]
        }
    }

    def update = {
        def championInstance = Champion.get(params.id)
        if (championInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (championInstance.version > version) {
                    
                    championInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'champion.label', default: 'Champion')] as Object[], "Another user has updated this Champion while you were editing")
                    render(view: "edit", model: [championInstance: championInstance])
                    return
                }
            }
            championInstance.properties = params
            if (!championInstance.hasErrors() && championInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'champion.label', default: 'Champion'), championInstance.id])}"
                redirect(action: "show", id: championInstance.id)
            }
            else {
                render(view: "edit", model: [championInstance: championInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def championInstance = Champion.get(params.id)
        if (championInstance) {
            try {
                championInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'champion.label', default: 'Champion'), params.id])}"
            redirect(action: "list")
        }
    }
}
