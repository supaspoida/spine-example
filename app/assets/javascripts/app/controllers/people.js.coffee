Person = App.Person

class App.People extends Spine.Controller
  constructor: ->
    super
    Person.bind 'refresh change', @render
    Person.fetch()

  render: =>
    people = Person.all()
    @html @view('people/index')(people: people)
