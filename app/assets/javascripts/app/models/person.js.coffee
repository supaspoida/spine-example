class App.Person extends Spine.Model
  @configure 'Person', 'name'
  @extend Spine.Model.Ajax

  @url: '/api/people'

  selector: ->
    if @already_followed
      'follow'
    else
      'unfollow'

  follow: ->
    @getFollow() || @newFollow()

  getFollow: ->
    App.Follow.findByAttribute('name', @name)

  newFollow: ->
    App.Follow.init name: @name


class App.Follow extends App.Person
  @configure 'Follow', 'name'
  @extend Spine.Model.Ajax
  @url: '/api/follows'

  selector: ->
    'follow'
