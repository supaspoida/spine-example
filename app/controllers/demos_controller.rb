class DemosController < ApplicationController

  expose(:people)  { Person.all }
  expose(:follow)  { Follow.new }

end
