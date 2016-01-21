class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		if @user.save
			redirect_to user_path
		else
			render :new
			flash[:alert] = "There was a problem creating your user :(" 
		end
	end
	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
	end

	def delete
		@user = User.find(params[:id])
		if @user.destroy
		else 
			redirect_to user_path
		end
		redirect_to users_path
		@user.avatar = nil
		@user.save
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :avatar)
	end
end
