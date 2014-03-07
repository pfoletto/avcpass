

import grails.test.mixin.*
import spock.lang.*

@TestFor(GruppoController)
@Mock(Gruppo)
class GruppoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.gruppoInstanceList
            model.gruppoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.gruppoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def gruppo = new Gruppo()
            gruppo.validate()
            controller.save(gruppo)

        then:"The create view is rendered again with the correct model"
            model.gruppoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            gruppo = new Gruppo(params)

            controller.save(gruppo)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/gruppo/show/1'
            controller.flash.message != null
            Gruppo.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def gruppo = new Gruppo(params)
            controller.show(gruppo)

        then:"A model is populated containing the domain instance"
            model.gruppoInstance == gruppo
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def gruppo = new Gruppo(params)
            controller.edit(gruppo)

        then:"A model is populated containing the domain instance"
            model.gruppoInstance == gruppo
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/gruppo/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def gruppo = new Gruppo()
            gruppo.validate()
            controller.update(gruppo)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.gruppoInstance == gruppo

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            gruppo = new Gruppo(params).save(flush: true)
            controller.update(gruppo)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/gruppo/show/$gruppo.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/gruppo/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def gruppo = new Gruppo(params).save(flush: true)

        then:"It exists"
            Gruppo.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(gruppo)

        then:"The instance is deleted"
            Gruppo.count() == 0
            response.redirectedUrl == '/gruppo/index'
            flash.message != null
    }
}
