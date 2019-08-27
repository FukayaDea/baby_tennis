class DiariesController < ApplicationController

	def index
		@diaries = Diary.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)
		@diary = Diary.new
	end

	def new
		@diary = Diary.new
	end

	def create
		Diary.create(create_params)
		@diaries = Diary.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)
		redirect_to action: :index

	end

	def destroy
		diary = Diary.find(params[:id])
		diary.destroy
		@diaries = Diary.includes(:user).all.order(created_at: :desc).page(params[:page]).per(50)


	end

	private
	def create_params
		params.require(:diary).permit(:text, :image).merge(user_id: current_user.id)
	end

end
