class GroupsController < ApplicationController

	def create
		Group.create(group_params)

		redirect_to :root
	end

	def show
		@groups = Group.where(event_id: params[:id])
	end

	def destroy
		group = Group.find(params[:id])
		group.destroy
		redirect_to :root
	end

	private
	def group_params
		params.permit(:event_id).merge(user_id: current_user.id)
	end
end
