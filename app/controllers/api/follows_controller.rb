module Api
  class FollowsController < ApplicationController
    expose(:follows) { Follow.people }
    expose(:follow_params) do
      params[:follow].presence || { id: params[:id] }
    end
    expose(:follow) { Follow.new(follow_params) }

    respond_to :json

    def index
      respond_with(follows)
    end

    def create
      follow.save
      respond_with(follow)
    end

    def destroy
      follow.destroy
      respond_with(follow, location: root_path)
    end
  end
end
