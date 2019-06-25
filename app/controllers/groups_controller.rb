class GroupsController < ApplicationController

	def create
		Group.create(group_params)
		redirect_to :root
	end

	def show
		
	end

	private
	def group_params
		params.permit(:event_id).merge(user_id: current_user.id)
	end
end
