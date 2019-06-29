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
		redirect_to :root
	end

	private
	def like_event_params
		params.permit(:event_id).merge(user_id: current_user.id)
	end
end
