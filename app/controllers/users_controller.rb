class UsersController < ApplicationController


	def index
		# puts "i am in path /users"
		@user =User.all
	end


	def  show
		@user = User.find(params[:id])
		# puts "I am in /users/id route"
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
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email , :password, :age, :degree, :role, :avatar)
    end
end
