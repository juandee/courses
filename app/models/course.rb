class Course < ApplicationRecord
	validates :title, presence: true
	validates :year, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 2016 }
	has_many :exams, dependent: :destroy
	has_many :pupils, dependent: :destroy
end
