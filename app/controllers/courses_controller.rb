class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :stats]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.sort_by { |c| c.year}
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def stats
    @hash_p = {}
    @course.pupils.each { |p|
      @hash_p[p.id] = {:nombre => p.full_name} 
    }
    @promedios = {}
    @ausencias = {}
    @aprobados = Hash.new(0)
    @desaprobados = Hash.new(0)
    @course.exams.each { |e|
      if e.grades.size > 0 
        @promedios[e.id] = 0
        e.grades.each { |g|
          @hash_p[g.pupil.id][e.id] = g.grade
          if g.grade >= e.min_grade
            @aprobados[e.id] += 1
          else
            @desaprobados[e.id] += 1
          end  
        }
        @promedios[e.id] = (@aprobados[e.id] / e.grades.size.to_f * 100).round(2)
        @ausencias[e.id] = @course.pupils.size - e.grades.size 
      end
    }
    @exams = @course.exams.sort_by {|e| e.date}
    @hash_p = @hash_p.sort_by { |k, v| v[:nombre]}
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'El curso fue creado correctamente.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'El curso fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'El curso fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:year, :title)
    end
end
