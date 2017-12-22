class Pupil < ApplicationRecord
  belongs_to :course
  has_many :grades, dependent: :destroy

  def full_name
    self.surname + " " + self.name
  end
end
