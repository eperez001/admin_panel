class InstructorsController < ApplicationController


	def index
		@instructor = User.where(role: 'Instructor')
	end


	def  show
		@instructor = User.find(params[:id])

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

     def instructor_params
        params.require(:instructor).permit(:user_id, :cohort_id)
    end
end
