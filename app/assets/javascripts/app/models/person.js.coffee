class App.Person extends Spine.Model
  @configure 'Person', 'name'
  @extend Spine.Model.Ajax

  @url: '/api/people'

class App.Follow extends App.Person
  @configure 'Follow'
  @extend Spine.Model.Ajax
  @url: '/api/follows'
