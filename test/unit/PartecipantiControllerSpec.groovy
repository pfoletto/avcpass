

import grails.test.mixin.*
import spock.lang.*

@TestFor(PartecipantiController)
@Mock(Partecipanti)
class PartecipantiControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.partecipantiInstanceList
            model.partecipantiInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.partecipantiInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def partecipanti = new Partecipanti()
            partecipanti.validate()
            controller.save(partecipanti)

        then:"The create view is rendered again with the correct model"
            model.partecipantiInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            partecipanti = new Partecipanti(params)

            controller.save(partecipanti)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/partecipanti/show/1'
            controller.flash.message != null
            Partecipanti.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def partecipanti = new Partecipanti(params)
            controller.show(partecipanti)

        then:"A model is populated containing the domain instance"
            model.partecipantiInstance == partecipanti
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def partecipanti = new Partecipanti(params)
            controller.edit(partecipanti)

        then:"A model is populated containing the domain instance"
            model.partecipantiInstance == partecipanti
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/partecipanti/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def partecipanti = new Partecipanti()
            partecipanti.validate()
            controller.update(partecipanti)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.partecipantiInstance == partecipanti

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            partecipanti = new Partecipanti(params).save(flush: true)
            controller.update(partecipanti)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/partecipanti/show/$partecipanti.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/partecipanti/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def partecipanti = new Partecipanti(params).save(flush: true)

        then:"It exists"
            Partecipanti.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(partecipanti)

        then:"The instance is deleted"
            Partecipanti.count() == 0
            response.redirectedUrl == '/partecipanti/index'
            flash.message != null
    }
}
