package openlabnotes

import org.openlab.notes.NoteItem

class NoteAccessService {

    def springSecurityService

    def grantAccess(NoteItem noteItemInstance) {

        if (springSecurityService.currentUser == noteItemInstance.creator) {
            return true
        } else if (springSecurityService.currentUser == noteItemInstance.supervisor) {
            return true
        } else if(springSecurityService.currentUser in noteItemInstance.shared){
            return true
        }
        else return false
    }
}
