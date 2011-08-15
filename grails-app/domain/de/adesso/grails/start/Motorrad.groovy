package de.adesso.grails.start

import org.grails.comments.Commentable
import org.grails.rateable.Rateable;

class Motorrad implements Commentable, Rateable {

	static searchable = true
	static expose = 'motorrad'
	
	String name
	Hersteller hersteller
	String beschreibung
	Date herstellungsDatum
	int geange

    static constraints = {
		name blank: false, unique: true
		hersteller blank: false
		herstellungsDatum blank: false
		beschreibung nullable: true, maxSize: 1000
		geange min: 0, max: 21
    }

		def toSearchResult() {
		return name
	}
}
