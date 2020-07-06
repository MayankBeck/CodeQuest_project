class UsersController < ApplicationController

	def register
		@user=User.new
	end

	def show
  	end

	def create
  	@user =User.new(user_params)
  	if @user.save
  		render 'user/'
  	else
  		render 'register'
  	end

  	end

  	private
   	def user_params
   		params.require(:user).permit(:name, :email , :phone_number)
   	end

end
