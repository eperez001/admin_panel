class UsersController < ApplicationController

	def index

		@user =User.all
	end


	def  show
		@user = User.find(params[:id])
	puts "I am in /users/id/route"
	end

	def new
		@user =User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to '/users'
	end


    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to '/users'
    end


    def destroy
         User.find(params[:id]).destroy
         redirect_to '/users'
    end


	private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email , :password, :age, :degree, :role)
    end
end
