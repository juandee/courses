require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save exam without title" do
  	@exam = exams(:one)
  	@exam.title = nil
  	assert_not @exam.save
  end

  test "date should be during course or beyond" do
  	@exam = exams(:one)
  	@exam.date = '1993-10-12'
  	assert_not @exam.save
  end

  test "minimun grade should be greater than 1" do
  	@exam = exams(:one)
  	@exam.min_grade = 0
  	assert_not @exam.save
  end

  test "should not save is minimun grade is absent" do
  	@exam = exams(:one)
  	@exam.min_grade = nil
  	assert_not @exam.save
  end

  test "minimun grade should be integer" do
  	@exam = exams(:one)
  	@exam.min_grade = 5.24
  	assert_not @exam.save
  end

  test "exams should have grades" do
  	assert exams(:one).grades.size == 3
  	assert_not exams(:two).grades.size == 0
    assert exams(:one).grades.include? grades(:one)
    assert exams(:one).grades.include? grades(:two)
    assert_not exams(:one).grades.include? grades(:four)
  end

  test "exam should belong to a course" do
    @exam1 = exams(:one)
    @exam2 = exams(:two)
    assert courses(:one).exams.include? @exam1
    assert_not courses(:two).exams.include? @exam1
  end

end
