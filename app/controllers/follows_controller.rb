class FollowsController < ApplicationController
  expose(:follow) { Follow.new(id: params[:id]) }

  respond_to :html

  def create
    follow.save
    respond_with(follow, location: root_path)
  end
end
