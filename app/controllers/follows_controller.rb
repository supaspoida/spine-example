class FollowsController < ApplicationController
  expose(:person_name) do
    params[:id] || params[:follow][:id]
  end
  expose(:follow) { Follow.new(id: person_name) }

  respond_to :html

  def create
    follow.save
    respond_with(follow, location: root_path)
  end

  def destroy
    follow.destroy
    respond_with(follow, location: root_path)
  end
end
