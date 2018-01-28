class Grade < ApplicationRecord
  validates :grade, presence: true, numericality: { true, greater_than_or_equal_to: 1 }
  belongs_to :exam
  belongs_to :pupil
end
