class GroupsController < ApplicationController

	def create
		Group.create(group_params)
		@event = Event.find(params[:event_id])
		redirect_to controller: :events, action: :show, id: @event.id
	end

	def show
		@groups = Group.includes(:user).where(event_id: params[:id])
		@event = Event.find(params[:id])
	end

	def destroy
		group = Group.find(params[:id])
		group.destroy
		redirect_to controller: :events, action: :show, id: group.event.id
	end

	private
	def group_params
		params.permit(:event_id).merge(user_id: current_user.id)
	end
end
