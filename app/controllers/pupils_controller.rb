class PupilsController < ApplicationController
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]
  before_action :set_course
  # GET /pupils
  # GET /pupils.json
  def index
    @pupils = @course.pupils.sort_by { |p| p.surname } 
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
  end

  # GET /pupils/new
  def new
    @pupil = Pupil.new
  end

  # GET /pupils/1/edit
  def edit
  end

  # POST /pupils
  # POST /pupils.json
  def create
    @pupil = @course.pupils.new(pupil_params)

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to course_pupil_path(@course,@pupil), notice: 'Pupil was successfully created.' }
        format.json { render :show, status: :created, location: @pupil }
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupils/1
  # PATCH/PUT /pupils/1.json
  def update
    respond_to do |format|
      if @pupil.update(pupil_params)
        format.html { redirect_to course_pupil_path(@course,@pupil), notice: 'Pupil was successfully updated.' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil.destroy
    respond_to do |format|
      format.html { redirect_to course_pupils_url, notice: 'Pupil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_params
      params.require(:pupil).permit(:name, :surname, :legajo, :dni, :email, :course_id)
    end
end
