class StudentsController < ApplicationController
  def index
    render json: Student.all
   end

  def show
    render json: Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: { message: 'User created' }, status: 200
    else
      render json: { error: 'Unable to create student' }, status: 400
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student
      @student.update(student_params)
        render json: { message: 'Student successfully updated' }, status: 200
    else
      render json: { error: 'Unable to update student' }, status: 400
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @student
      @student.destroy
        render json: { message: 'Student successfully deleted' }, status: 200
    else
      render json: { error: 'Unable to delete Student' }, status: 400
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :rno)
  end
end
