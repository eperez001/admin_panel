class CohortsController < ApplicationController


	def index
		@cohort = Cohort.all
	end


	def  show
		@cohort = Cohort.find(params[:id])
	end

	def new
		@cohort = Cohort.new


	end

	def create
		@cohort = Cohort.create(cohort_params)
		puts @cohort.errors.messages
		redirect_to '/cohorts'
	end


    def edit
        @cohort = Cohort.find(params[:id])
    end

    def update
        @cohort = Cohort.find(params[:id])
        @cohort.update(cohort_params)
        redirect_to '/cohorts'
    end


    def destroy
        Course.find(params[:id]).destroy
        redirect_to '/cohorts'
    end


	private
    def cohort_params
      params.require(:cohort).permit(:name, :start, :end, :course_id)
    end
end
