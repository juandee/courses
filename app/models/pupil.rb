class Pupil < ApplicationRecord
  belongs_to :course
  has_many :grades, dependent: :destroy
end
