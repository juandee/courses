class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :set_exam
  # GET /grades
  # GET /grades.json
  def index
    @pupils = @exam.course.pupils.sort_by { |p| p.surname }
    #@grades = @exam.grades
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = @exam.grades.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to course_exam_grade_path(@exam.course,@exam,@grade), notice: 'La nota fue creada correctamente.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to course_exam_grade_path(@exam.course,@exam,@grade), notice: 'La nota fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to course_exam_grades_url, notice: 'La nota fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:grade, :exam_id, :pupil_id)
    end
end
