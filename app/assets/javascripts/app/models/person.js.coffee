class App.Person extends Spine.Model
  @configure 'Person'
  @extend Spine.Model.Ajax

  @url: '/api/people'

  selector: ->
    if @already_followed
      'follow'
    else
      'unfollow'

class App.Follow extends App.Person
  @configure 'Follow'
  @extend Spine.Model.Ajax
  @url: '/api/follows'
