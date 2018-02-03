class Pupil < ApplicationRecord
  validates :name, :surname, :email, :legajo, :dni, presence: true
  validates :dni, numericality: { only_integer: true }
  belongs_to :course
  has_many :grades, dependent: :destroy

  def full_name
    self.surname + " " + self.name
  end

  def nota(exam)
  	g = grades.where(exam_id: exam.id)
    g.take.try(:grade)
  end

  def rindio?(exam)
  	!self.nota(exam).nil?
  end

  def aprobo?(exam)
  	self.nota(exam) >= exam.min_grade
  end
end
