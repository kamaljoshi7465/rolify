module Api 
    module V1 

        class StudentsController < ApplicationController
            before_action only: %i[ show edit update destroy ]
        
            def index
                render json: Student.all 
            end
        
            def show
                render json: Student.find(params[:id])
            end
        
            def new
                render json: Student.new
            end
        
            def edit
                @student = Student.find(params[:id])
            end
        
            def create
                @student = Student.new(student_params)

                if @student.save
                    render json: @student, status: :created
                else
                    render json: @student.errors, status: :unprocessable_entity
                end
            end

            def update
                @student = Student.find(params[:id])
                if @student.update(student_params)
                    render json: "Succesfully updated"
                else
                  render json: @student.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @student = Student.find(params[:id])
                @student.destroy
                render json: "Succesfully deleted"
            end
        
            private
            def student_params
                params.permit(:name, :age )
            end
        end
    end 
end