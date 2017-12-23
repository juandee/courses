class Course < ApplicationRecord
	validates :title, :year, presence: true
	has_many :exams, dependent: :destroy
	has_many :pupils, dependent: :destroy
end
