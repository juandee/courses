class Course < ApplicationRecord
	has_many :exams, dependent: :destroy
	has_many :pupils, dependent: :destroy
end
