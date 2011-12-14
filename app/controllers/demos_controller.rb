class DemosController < ApplicationController

  expose(:follow)  { Follow.new    }
  expose(:follows) { Follow.people }

end
