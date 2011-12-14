Follow = App.Follow

class App.Follows extends Spine.Controller
  tag: 'ul'
  el: '#follows'

  constructor: ->
    super
    Follow.bind 'refresh change', @render
    Follow.fetch()

  render: =>
    people = Follow.all()
    @html @view('people/index')(people: people)
