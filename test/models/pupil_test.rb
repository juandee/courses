require 'test_helper'

class PupilTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save pupil without name" do
  	@pupil = pupils(:two)
  	@pupil.name = nil
  	assert_not @pupil.save
  end

  test "should not save pupil without surname" do
  	@pupil = pupils(:two)
  	@pupil.surname = nil
  	assert_not @pupil.save
  end

  test "should not save pupil withou dni" do
  	@pupil = pupils(:two)
  	@pupil.dni = nil
  	assert_not @pupil.save
  end

  test "dni should be integer" do
  	@pupil = pupils(:two)
  	@pupil.dni = 'pepe'
  	assert_not @pupil.save
  end

  test "should not save pupil without legajo" do 
  	@pupil = pupils(:two)
  	@pupil.legajo = nil
  	assert_not @pupil.save
  end

  test "pupil has grades" do
  	assert pupils(:one).grades.include? grades(:one)
  	assert_not pupils(:one).grades.include? grades(:two)
  end

  test "pupil belongs to a course" do
  	assert courses(:one).pupils.include? pupils(:one)
  	assert courses(:one).pupils.include? pupils(:three)
  	assert_not courses(:one).pupils.include? pupils(:two)
  end

  test "pupil attended to an exam" do
  	assert pupils(:one).rindio?(exams(:one))
  	assert pupils(:two).rindio?(exams(:one))
  	assert_not pupils(:four).rindio?(exams(:one))
  end

  test "pupil passed exam" do
  	assert_not pupils(:one).aprobo?(exams(:one))
  	assert pupils(:two).aprobo?(exams(:one))
  	assert_not pupils(:three).aprobo?(exams(:one))
  end

end
