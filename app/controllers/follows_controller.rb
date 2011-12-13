class FollowsController < ApplicationController
  expose(:follow) { Follow.new(params[:follow]) }

  respond_to :html

  def create
    follow.save
    respond_with(follow, location: root_path)
  end
end
