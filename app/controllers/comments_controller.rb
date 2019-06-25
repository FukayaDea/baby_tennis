class CommentsController < ApplicationController
	
	def new
		@event = Event.find(params[:event_id])
		@comment = Comment.new
		@comment.event_id = @event.id
	end

	def create
		@comment = Comment.create(create_params)
		redirect_to :root and return
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to :root and return
	end

	private
	def create_params
		params.require(:comment).permit(:event_id, :text).merge(user_id: current_user.id)
	end
end
