#= require hamlcoffee
#= require json2
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

$.fn.person = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  App.Person.find(elementID)

class App extends Spine.Controller
  constructor: ->
    super

    @people = new App.People el: 'ul#people'
    @follows = new App.Follows el: 'ul#follows'

    Spine.Route.setup()

window.App = App
