require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save course without year" do
  	@course = Course.create(:title => 'Un mal curso')
  	assert_not @course.save
  end

  test "should not save course without title" do
  	@course = Course.create(:year => 2016)
  	assert_not @course.save
  end

  test "should not save course blank" do
  	@course = Course.new
  	assert_not @course.save
  end

  test "course's year should not be a string" do
  	@course = Course.create(:title => 'Una cursada', :year => 'El año 1')
  	assert_not @course.save
  end

  test "should only be one course in the year" do
  	@course1 = Course.create(:title => 'Curso 1', :year => 2018)
  	@course2 = Course.create(:title => 'Curso 2', :year => 2018)
  	@course1.save
  	assert_not @course2.save
  end

  test "course should have pupils" do
  	assert courses(:one).pupils.any?
  end

  test "course should have exams" do
  	assert courses(:two).exams.any?
  end

  test "course should not have pupils" do
  	assert_not courses(:three).pupils.any?
  end 

  test "course should not have exams" do
  	assert_not courses(:three).exams.any?
  end

  test "pupils belongs to course" do
    assert courses(:one).pupils.size == 2
    assert courses(:one).pupils.include? pupils(:one)
    assert courses(:one).pupils.include? pupils(:three)
    assert_not courses(:one).pupils.include? pupils(:two)
  end

  test "exams belong to course" do
    assert courses(:one).exams.size == 1
    assert_not courses(:two).exams.size == 0
    assert courses(:one).exams.include? exams(:one)
    assert_not courses(:two).pupils.include? exams(:one)
  end

end
