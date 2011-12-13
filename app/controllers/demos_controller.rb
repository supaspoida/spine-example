class DemosController < ApplicationController

  expose(:people)  { Person.all    }
  expose(:follow)  { Follow.new    }
  expose(:follows) { Follow.people }

end
