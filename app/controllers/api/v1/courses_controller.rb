module Api 
    module V1 

        class CoursesController < ApplicationController
            before_action only: %i[ show edit update destroy ]
        
            def index
                render json: Course.all 
            end
        
            def show
                render json: Course.find(params[:id])
            end
        
            def new
                render json: Course.new
            end
        
            def edit
                @course = Course.find(params[:id])
            end
        
            def create
                @course = Course.new(course_params)

                if @course.save
                    render json: @course, status: :created
                else
                    render json: @course.errors, status: :unprocessable_entity
                end
            end
        
            def update
                @course = Course.find(params[:id])
                if @course.update(course_params)
                    render json: "Succesfully updated"
                else
                  render json: @course.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @course = Course.find(params[:id])
                @course.destroy
                render json: "Succesfully deleted"
            end
        
            private
            def course_params
                params.permit(:sub1, :sub2)
            end
        end
    end 
end