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
  events:
    'click [data-type=follow]': 'follow'
    'click [data-type=unfollow]': 'unfollow'

  constructor: ->
    super

    @people = new App.People el: 'ul#people'
    @follows = new App.Follows el: 'ul#follows'

    Spine.Route.setup()

  follow: (e) ->
    e.preventDefault()
    person = $(e.target).person()

    $people = $("[data-id='#{person.name}']")
    $people.toggleClass('follow').toggleClass('unfollow')

    follow = person.follow()
    follow.save()

  unfollow: (e) ->
    e.preventDefault()
    person = $(e.target).person()

    $people = $("[data-id='#{person.name}']")
    $people.toggleClass('unfollow').toggleClass('follow')

    follow = person.follow()
    follow.destroy()

window.App = App
