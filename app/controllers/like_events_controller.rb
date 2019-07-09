class LikeEventsController < ApplicationController

	def create
		LikeEvent.create(like_event_params)
		redirect_to :root
	end

	def show
		
	end

	def destroy
		like_event = LikeEvent.find(params[:id])
		like_event.destroy
		user = like_event.user
		redirect_to controller: :users, action: :show, id: user.id
	end

	private
	def like_event_params
		params.permit(:event_id).merge(user_id: current_user.id)
	end
end
