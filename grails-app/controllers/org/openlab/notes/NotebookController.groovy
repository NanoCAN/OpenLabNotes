package org.openlab.notes

import org.hibernate.criterion.CriteriaSpecification

class NotebookController {

    def scaffold = true

    def show(){

        def notebookInstance = Notebook.get(params.id)
        params.max = 1
        params.offset = params.offset?:0

        def noteItemInstanceList = notebookInstance.notes
        println noteItemInstanceList
        def noteItemInstanceListTotal = noteItemInstanceList?.size()?:0
        if (params.int('offset') > noteItemInstanceListTotal) params.offset = 0

        if(noteItemInstanceListTotal > 0)
        {
            int rangeMin = Math.min(noteItemInstanceListTotal, params.int('offset'))
            int rangeMax = Math.min(noteItemInstanceListTotal, (params.int('offset') + params.int('max')))

            noteItemInstanceList = noteItemInstanceList.asList()
            noteItemInstanceList.sort{ a,b -> a.id <=> b.id}
            if(params.order == "desc") noteItemInstanceList = noteItemInstanceList.reverse()

            noteItemInstanceList = noteItemInstanceList.asList().subList(rangeMin, rangeMax)
        }

        [notebookInstance: notebookInstance, noteItemInstanceList: noteItemInstanceList,
                        noteItemInstanceTotal: noteItemInstanceListTotal,
                        bodyOnly: true]
    }
}
