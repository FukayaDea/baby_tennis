class UsersController < ApplicationController
	def show
		@user = User.includes(:events, :comments, :commented_events).find(params[:id])
		@events = @user.events.order(created_at: :desc)
		@co_events = @user.commented_events.order(created_at: :desc)
		@comments = @user.comments.order(created_at: :desc)
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
