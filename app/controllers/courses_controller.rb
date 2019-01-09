class CoursesController < ApplicationController
	# layout 'layout'

	def index
		puts "i am in path /courses"
		@course = Course.all
	end


	def  show
		puts "I am in /courses/id route"
		@course = Course.find(params[:id])
	end

	def new
		@course = Course.new

	end

	def create
		@course = Course.create(course_params)
		redirect_to '/courses'
	end


    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        @course.update(course_params)
        redirect_to '/courses'
    end


    def destroy
        Course.find(params[:id]).destroy
        redirect_to '/courses'
    end






	    private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def course_params
      params.require(:course).permit(:name, :total_hrs)
    end
end
