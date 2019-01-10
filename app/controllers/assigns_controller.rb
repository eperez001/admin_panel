class AssignsController < ApplicationController



	def new
		@user = User.find(params[:id])
		@student_role = User.where(role: 'Student')
		@instructor_role =User.where(role: 'Instructor')
		@instructor = Instructor.new
		@student = Student.new

        puts @user.role
        puts @student_role
	end

	def create
		@instructor = Instructor.create(instructor_params)
		@student = Student.create(student_params)
		redirect_to '/users'
	end


    def edit
    	@user = User.find(params[:id])
        @student = Student.find_by(user_id: params[:id])
        @instructor = Instructor.find_by(user_id: params[:id])
    end

    def update
        @instructor = Instructor.find(params[:id])
        @instructor.update(instructor_params)
        @student = Student.find(params[:id])
        @student.update(instructor_params)
        redirect_to '/users'
    end


    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        @insructor = Instructor.find(params[:id])
        @insructor.destroy
        redirect_to '/users'
    end


		private	
    def student_params
        params.require(:student).permit(:user_id, :cohort_id, :grade)
    end

    def instructor_params
        params.require(:instructor).permit(:user_id, :cohort_id)
    end
end
