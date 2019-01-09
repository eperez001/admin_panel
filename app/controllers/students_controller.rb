class StudentsController < ApplicationController


	def index
		puts "i am in path /students"
		@student = User.where(role: 'Student')
		@user_stud = Student.all
	end


	def  show
		puts "I am in /students/id route"
		@student =User.where(role: 'Student')
	end

    def new
		@student =User.new
	end

	def create
		@student = Student.create(student_params)
		redirect_to '/students'
	end


    def edit
        @student = User.find(params[:id])
    end


    def update
        @student = User.find(params[:id])
        @student.update(student_params)
        redirect_to '/students'
    end


    def destroy
        User.find(params[:id]).destroy
        redirect_to '/students'
    end


	private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :email , :password, :age, :degree, :role, :avatar)
    # end
    def student_params
        params.require(:student).permit(:user_id, :cohort_id, :grade)
    end
end
