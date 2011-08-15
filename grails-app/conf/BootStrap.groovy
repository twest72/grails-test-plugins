import org.adesso.grails.start.sec.SecRole
import org.adesso.grails.start.sec.SecUser
import org.adesso.grails.start.sec.SecUserSecRole

import de.adesso.grails.start.Hersteller
import de.adesso.grails.start.Motorrad


class BootStrap {

	def init = { servletContext ->
		environments {
			development {
				Hersteller ducati = new Hersteller(name: "Ducati").save(failOnError: true)
				new Hersteller(name: "Bimota").save(failOnError: true)

				Motorrad monster1000 = new Motorrad(name: "Monster 1000")
				monster1000.beschreibung = 'Weniger ist mehr. Dieses Credo hat die Monster weltweit zur Legende gemacht. Jetzt wird diese Philosophie völlig neu definiert.'
				monster1000.hersteller = ducati
				monster1000.herstellungsDatum = new Date()
				monster1000.save(failOnError: true)

				
				SecRole adminRole = new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
				SecUser adminUser = new SecUser(username: 'admin', password: 'admin', enabled: true)
				adminUser.save(failOnError: true)
				SecUserSecRole.create adminUser, adminRole

				SecUser adminUser2 = new SecUser(username: 'admin2', password: 'admin2', enabled: true)
				adminUser2.save(failOnError: true)
				SecUserSecRole.create adminUser2, adminRole
				}
		}
	}
	def destroy = {
	}
}
