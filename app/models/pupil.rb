class Pupil < ApplicationRecord
  validates :name, :surname, :email, :legajo, :dni, presence: true
  belongs_to :course
  has_many :grades, dependent: :destroy

  def full_name
    self.surname + " " + self.name
  end
end
