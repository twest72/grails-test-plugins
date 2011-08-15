package de.adesso.grails.start

import grails.plugins.springsecurity.Secured

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.compass.core.engine.SearchEngineQueryParseException

class MotorradController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def searchableService

	def exportService

	@Secured(['ROLE_ADMIN'])
	def index = {
		def model = list()

		if(params?.format && params.format != "html") {
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=motorraeder.${params.extension}")
			exportService.export(params.format, response.outputStream, model.motorradInstanceList, [:], [:])
		}

		if (params.q?.trim()) {
			try {
				println params
				println params.q
				def searchResult = [searchResult: searchableService.search(params.q, params)]
				println searchResult
				println model
				model << searchResult
				println model
			} catch (SearchEngineQueryParseException ex) {
				return [parseException: true]
			}
		}

		return model
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[motorradInstanceList: Motorrad.list(params), motorradInstanceTotal: Motorrad.count()]
	}

	def create = {
		def motorradInstance = new Motorrad()
		motorradInstance.properties = params
		return [motorradInstance: motorradInstance]
	}

	def save = {
		def motorradInstance = new Motorrad(params)
		if (motorradInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), motorradInstance.id])}"
			redirect(action: "show", id: motorradInstance.id)
		}
		else {
			render(view: "create", model: [motorradInstance: motorradInstance])
		}
	}

	def show = {
		def motorradInstance = Motorrad.get(params.id)
		if (!motorradInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
			redirect(action: "list")
		}
		else {
			[motorradInstance: motorradInstance]
		}
	}

	def edit = {
		def motorradInstance = Motorrad.get(params.id)
		if (!motorradInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [motorradInstance: motorradInstance]
		}
	}

	def update = {
		def motorradInstance = Motorrad.get(params.id)
		if (motorradInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (motorradInstance.version > version) {

					motorradInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'motorrad.label', default: 'Motorrad')]
					as Object[], "Another user has updated this Motorrad while you were editing")
					render(view: "edit", model: [motorradInstance: motorradInstance])
					return
				}
			}
			motorradInstance.properties = params
			if (!motorradInstance.hasErrors() && motorradInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), motorradInstance.id])}"
				redirect(action: "show", id: motorradInstance.id)
			}
			else {
				render(view: "edit", model: [motorradInstance: motorradInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def motorradInstance = Motorrad.get(params.id)
		if (motorradInstance) {
			try {
				motorradInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'motorrad.label', default: 'Motorrad'), params.id])}"
			redirect(action: "list")
		}
	}
}
