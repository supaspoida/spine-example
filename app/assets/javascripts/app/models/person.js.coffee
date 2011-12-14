class App.Person extends Spine.Model
  @configure 'Person', 'name'
  @extend Spine.Model.Ajax

  @url: '/api/people'
