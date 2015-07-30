package auction

class DestinationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [destinationInstanceList: Destination.list(params), destinationInstanceTotal: Destination.count()]
    }

    def create = {
        def destinationInstance = new Destination()
        destinationInstance.properties = params
        return [destinationInstance: destinationInstance]
    }

    def save = {
        def destinationInstance = new Destination(params)
        if (destinationInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'destination.label', default: 'Destination'), destinationInstance.id])}"
            redirect(action: "show", id: destinationInstance.id)
        }
        else {
            render(view: "create", model: [destinationInstance: destinationInstance])
        }
    }

    def show = {
        def destinationInstance = Destination.get(params.id)
        if (!destinationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
            redirect(action: "list")
        }
        else {
            [destinationInstance: destinationInstance]
        }
    }

    def edit = {
        def destinationInstance = Destination.get(params.id)
        if (!destinationInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [destinationInstance: destinationInstance]
        }
    }

    def update = {
        def destinationInstance = Destination.get(params.id)
        if (destinationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (destinationInstance.version > version) {
                    
                    destinationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'destination.label', default: 'Destination')] as Object[], "Another user has updated this Destination while you were editing")
                    render(view: "edit", model: [destinationInstance: destinationInstance])
                    return
                }
            }
            destinationInstance.properties = params
            if (!destinationInstance.hasErrors() && destinationInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'destination.label', default: 'Destination'), destinationInstance.id])}"
                redirect(action: "show", id: destinationInstance.id)
            }
            else {
                render(view: "edit", model: [destinationInstance: destinationInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def destinationInstance = Destination.get(params.id)
        if (destinationInstance) {
            try {
                destinationInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'destination.label', default: 'Destination'), params.id])}"
            redirect(action: "list")
        }
    }
}
