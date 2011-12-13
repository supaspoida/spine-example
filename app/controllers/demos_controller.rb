class DemosController < ApplicationController

  expose(:people) { Person.all }

end
