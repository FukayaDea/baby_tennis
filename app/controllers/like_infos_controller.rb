class LikeInfosController < ApplicationController
	def create
		LikeInfo.create(like_info_params)
		@tennis_infos = TennisInfo.includes(:user).all.order(created_at: :desc).page(params[:page]).per(20)


	end


	def destroy
		like_info = LikeInfo.find_by(tennis_info_id: params[:tennis_info_id], user_id: current_user.id)
		like_info.destroy
		@tennis_infos = TennisInfo.includes(:user).all.order(created_at: :desc).page(params[:page]).per(20)


	end

	def show
		@glike_infos = LikeInfo.includes(:user).where(info_id: params[:id])
		
	end

	private
	def like_info_params
		params.permit(:tennis_info_id).merge(user_id: current_user.id)
	end
end
