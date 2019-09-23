class ChatsController < ApplicationController

	def index
		@chats = Chat.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)
		@chat = Chat.new
		

		@like_chat = LikeChat.new
	end

	def new
		
	end

	def create
		Chat.create(create_params)
		@chats = Chat.includes(:user).all.order(created_at: :desc)

	end

	def destroy
		chat = Chat.find(params[:id])
		chat.destroy
		@chats = Chat.includes(:user).all.order(created_at: :desc)


	end

	private
	def create_params
		params.require(:chat).permit(:text).merge(user_id: current_user.id)
	end
end
