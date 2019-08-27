class LikeChatsController < ApplicationController

	def create
		LikeChat.create(like_chat_params)
		@chats = Chat.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)


	end


	def destroy
		like_chat = LikeChat.find_by(chat_id: params[:chat_id], user_id: current_user.id)
		like_chat.destroy
		@chats = Chat.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)


	end

	def show
		@glike_chats = LikeChat.includes(:user).where(chat_id: params[:id])
		
	end

	private
	def like_chat_params
		params.permit(:chat_id).merge(user_id: current_user.id)
	end
end
