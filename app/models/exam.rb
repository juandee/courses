class Exam < ApplicationRecord
  validates :date, :title, presence: true
  validates :min_grade, presence: true, numericality: { only_integer: true }
  belongs_to :course
  has_many :grades, dependent: :destroy
end
