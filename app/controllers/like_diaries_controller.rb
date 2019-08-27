class LikeDiariesController < ApplicationController
	def create
		LikeDiary.create(like_diary_params)
		@diaries = Diary.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)

	end


	def destroy
		like_diary = LikeDiary.find_by(diary_id: params[:diary_id], user_id: current_user.id)
		like_diary.destroy
		@diaries = Diary.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)

	end

	def show
		@like_diaries = LikeDiary.includes(:user).where(diary_id: params[:id])
		
	end

	private
	def like_diary_params
		params.permit(:diary_id).merge(user_id: current_user.id)
	end
end
