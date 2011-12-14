module Api
  class PeopleController < ApplicationController
    expose(:people) { Person.all }

    respond_to :json

    def index
      respond_with people
    end

  end
end
