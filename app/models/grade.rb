class Grade < ApplicationRecord
  validates :grade, presence: true, numericality: true
  belongs_to :exam
  belongs_to :pupil
end
