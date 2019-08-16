class EventsController < ApplicationController

   before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]

	def index
		@events = Event.includes(:user, :comments, :like_events).all.order(updated_at: :desc).page(params[:page]).per(10)
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(event_params)
		if @event.save
			return
		else
			flash.now[:alert] = "投稿に失敗しました"
			render action: :new
		end

	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(update_params)
		if @event.save
			redirect_to action: :show
		else
			flash.now[:alert] = "編集に失敗しました"
			render action: :edit
		end
	end

	def show
		@event = Event.includes(:groups, :like_events).find(params[:id])
		@event_time = @event.meeting_time.strftime("%H時%M分")
		@comments = @event.comments.order(created_at: :desc).page(params[:page]).per(5)
		@groups = Group.where(event_id: params[:id])
		@like_events = LikeEvent.where(event_id: params[:id])
		@comment = Comment.new
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
		flash[:notice] = "イベントを削除しました"
		redirect_to action: :index
	end

	# 検索

	def search
		@events = Event.where('prefecture LIKE(?)', "%#{params[:keyword]}%").order(created_at: :desc).page(params[:page]).per(5)
	end


	private
	def event_params
		params.require(:event).permit(:event_date, :prefecture, :court, :court_url, :meeting_place, :meeting_time, :access, :budget, :max_member, :racket, :remarks).merge(user_id: current_user.id)
	end

	def update_params
		params.require(:event).permit(:event_date, :prefecture, :court, :court_url, :meeting_place, :meeting_time, :access, :budget, :max_member, :racket, :remarks)
	end

	def move_to_index
		redirect_to action: :index unless user_signed_in?
	end
end
