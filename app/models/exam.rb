class Exam < ApplicationRecord
  validates :date, :title, presence: true
  validates :min_grade, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  belongs_to :course
  has_many :grades, dependent: :destroy
  validate :course_year

  def update_grades(params)
    params.each_pair do |key, val|
      grade = grades.where(exam_id: id, pupil_id: key).first
      if grade
        grade.grade = val
        grade.save
      else
        Grade.create(pupil_id: key, exam_id: id, grade: val)
      end
    end
  end

  def course_year
    errors.add(:date, "La fecha de examen debe ser del año de la cursada en adelante") unless (date.year >= course.year)
  end
  
end

