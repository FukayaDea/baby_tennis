class TennisInfosController < ApplicationController
	def index
		@tennis_infos = TennisInfo.includes(:user).all.order(created_at: :desc).page(params[:page]).per(20)
		@tennis_info = TennisInfo.new
	end

	def new
		
	end

	def create
		TennisInfo.create(create_params)
		@tennis_infos = TennisInfo.includes(:user).all.order(created_at: :desc).page(params[:page]).per(20)

	end

	def destroy
		tennis_info = TennisInfo.find(params[:id])
		tennis_info.destroy
		@tennis_infos = TennisInfo.includes(:user).all.order(created_at: :desc).page(params[:page]).per(20)


	end

	def search
		@tennis_infos = TennisInfo.where('text LIKE(?)', "%#{params[:keyword]}%").order(created_at: :desc).page(params[:page]).per(20)
	end

	private
	def create_params
		params.require(:tennis_info).permit(:text).merge(user_id: current_user.id)
	end
end
