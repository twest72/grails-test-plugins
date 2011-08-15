package de.adesso.grails.start

class HerstellerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [herstellerInstanceList: Hersteller.list(params), herstellerInstanceTotal: Hersteller.count()]
    }

    def create = {
        def herstellerInstance = new Hersteller()
        herstellerInstance.properties = params
        return [herstellerInstance: herstellerInstance]
    }

    def save = {
        def herstellerInstance = new Hersteller(params)
        if (herstellerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), herstellerInstance.id])}"
            redirect(action: "show", id: herstellerInstance.id)
        }
        else {
            render(view: "create", model: [herstellerInstance: herstellerInstance])
        }
    }

    def show = {
        def herstellerInstance = Hersteller.get(params.id)
        if (!herstellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
            redirect(action: "list")
        }
        else {
            [herstellerInstance: herstellerInstance]
        }
    }

    def edit = {
        def herstellerInstance = Hersteller.get(params.id)
        if (!herstellerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [herstellerInstance: herstellerInstance]
        }
    }

    def update = {
        def herstellerInstance = Hersteller.get(params.id)
        if (herstellerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (herstellerInstance.version > version) {
                    
                    herstellerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'hersteller.label', default: 'Hersteller')] as Object[], "Another user has updated this Hersteller while you were editing")
                    render(view: "edit", model: [herstellerInstance: herstellerInstance])
                    return
                }
            }
            herstellerInstance.properties = params
            if (!herstellerInstance.hasErrors() && herstellerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), herstellerInstance.id])}"
                redirect(action: "show", id: herstellerInstance.id)
            }
            else {
                render(view: "edit", model: [herstellerInstance: herstellerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def herstellerInstance = Hersteller.get(params.id)
        if (herstellerInstance) {
            try {
                herstellerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'hersteller.label', default: 'Hersteller'), params.id])}"
            redirect(action: "list")
        }
    }
}
