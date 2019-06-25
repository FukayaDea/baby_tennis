class EventsController < ApplicationController

    before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]

	def index
		@events = Event.includes(:user, :comments).all.order(created_at: :desc)
	end

	def new
		
	end

	def create
		Event.create(event_params)
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		event.update(update_params)
	end

	def show
		@event = Event.find(params[:id])
		@comments = @event.comments
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
		redirect_to action: :index
	end

	def search
		@events = Event.where('prefecture LIKE(?)', "%#{params[:keyword]}%")
	end

	private
	def event_params
		params.permit(:event_date, :prefecture, :court, :court_url, :meeting_place, :meeting_time, :access, :budget, :max_member, :joining, :racket, :remarks).merge(user_id: current_user.id)
	end

	def update_params
		params.require(:event).permit(:event_date, :prefecture, :court, :court_url, :meeting_place, :meeting_time, :access, :budget, :max_member, :joining, :racket, :remarks)
	end

	def move_to_index
		redirect_to action: :index unless user_signed_in?
	end
end
