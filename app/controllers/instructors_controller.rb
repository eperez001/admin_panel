class InstructorsController < ApplicationController


	# layout 'layout'

	def index
		@instructor = User.where(role: 'Instructor')
	end


	def  show
		@instructor = User.find(params[:id])
		# @user_instructor = User.where(role: 'Instructor')
	end

	def new
		@instructor = User.new
	end

	def create
		@instructor = Instructor.create(instructor_params)
		redirect_to '/instructors'
	end


    def edit
        @instructor = User.find(params[:id])
    end

    def update
        @instructor = User.find(params[:id])
        @instructor.update(instructor_params)
        redirect_to '/instructors'
    end


    def destroy
        Instructor.find(params[:id]).destroy
        redirect_to '/instructors'
    end


	private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.

 # def user_params
 #      params.require(:user).permit(:first_name, :last_name, :email , :password, :age, :degree, :role, :avatar)
 #    end

     def instructor_params
        params.require(:instructor).permit(:user_id, :cohort_id)
    end
end
