require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "grade should not be nil" do
  	@grade = Grade.new
  	assert_not @grade.save
  end

  test "grade should be integer" do
  	@grade = grades(:one)
  	@grade.grade = 5.5
  	assert_not @grade.save
  	@grade.grade = 6
  	assert @grade.save
    @grade.grade = 'una nota'
    assert_not @grade.save
  end

  test "grade should be greater o equal to zero" do
  	@grade = grades(:one)
  	@grade.grade = 5
  	assert @grade.save
  	@grade.grade = 0
  	assert @grade.save
  	@grade.grade = -1
  	assert_not @grade.save
  end

  test "grade should belong to a pupil" do 
    assert pupils(:one).grades.include? grades(:one)
    assert_not pupils(:one).grades.include? grades(:two)
  end

  test "grade should belong to an exam" do
    assert exams(:one).grades.include? grades(:one)
    assert exams(:one).grades.include? grades(:two)
    assert exams(:one).grades.include? grades(:three)
    assert_not exams(:one).grades.include? grades(:four)
  end

end
