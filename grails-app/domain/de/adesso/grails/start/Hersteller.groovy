package de.adesso.grails.start

class Hersteller {

	static searchable = true
	static expose = 'hersteller'
	
	String name
	boolean aktiv = true

	static constraints = {
		name blank: false, unique: true
    }

	def toSearchResult() {
		return name
	}
}
