

import grails.test.mixin.*
import spock.lang.*

@TestFor(DittaController)
@Mock(Ditta)
class DittaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.dittaInstanceList
            model.dittaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.dittaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def ditta = new Ditta()
            ditta.validate()
            controller.save(ditta)

        then:"The create view is rendered again with the correct model"
            model.dittaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            ditta = new Ditta(params)

            controller.save(ditta)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/ditta/show/1'
            controller.flash.message != null
            Ditta.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def ditta = new Ditta(params)
            controller.show(ditta)

        then:"A model is populated containing the domain instance"
            model.dittaInstance == ditta
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def ditta = new Ditta(params)
            controller.edit(ditta)

        then:"A model is populated containing the domain instance"
            model.dittaInstance == ditta
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/ditta/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def ditta = new Ditta()
            ditta.validate()
            controller.update(ditta)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.dittaInstance == ditta

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            ditta = new Ditta(params).save(flush: true)
            controller.update(ditta)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/ditta/show/$ditta.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/ditta/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def ditta = new Ditta(params).save(flush: true)

        then:"It exists"
            Ditta.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(ditta)

        then:"The instance is deleted"
            Ditta.count() == 0
            response.redirectedUrl == '/ditta/index'
            flash.message != null
    }
}
