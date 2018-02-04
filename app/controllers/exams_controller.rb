class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy, :gradesupload, :gradesupdate]
  before_action :set_course
  # GET /exams
  # GET /exams.json
  def index
    @exams = @course.exams.sort_by { |e| e.date }
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  def gradesupload
    @pupils = @exam.course.pupils.sort_by { |p| p.surname}
  end

  def gradesupdate
    if @exam.update_grades(results_params)
      redirect_to course_exam_grades_path(@course,@exam), notice: 'Las notas se actualizaron correctamente.'
    else
      render gradesupload_course_exam_path(@course,@exam), notice: 'Ocurrio un error al intentar actualizar las notas'
    end
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = @course.exams.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to course_exam_path(@course,@exam), notice: 'El examen se creo correctamente.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to course_exam_path(@course,@exam), notice: 'El examen se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to course_exams_url, notice: 'El examen fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:date, :title, :min_grade, :course_id)
    end

    def results_params
      params.require(:results)
    end

end
