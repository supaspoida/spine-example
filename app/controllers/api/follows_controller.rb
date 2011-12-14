module Api
  class FollowsController < ApplicationController
    expose(:follows) { Follow.people }

    respond_to :json

    def index
      respond_with(follows)
    end
  end
end
