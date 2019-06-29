class UsersController < ApplicationController
	def show
		@user = User.includes(:events, :comments, :commented_events).find(params[:id])
		@events = @user.events.order(created_at: :desc).page(params[:page]).per(2)
		@co_events = @user.commented_events.order(created_at: :desc).distinct
		@comments = @user.comments.order(created_at: :desc)
		@event_comments = EventComment.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(2)
		@groups = Group.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(2)
	end

	def edit
		
	end

	def update
		current_user.update(update_params)
		redirect_to action: :show
	end

	private
	def update_params
		params.require(:user).permit(:image, :nickname, :career, :play_erea, :profile)
	end
end
