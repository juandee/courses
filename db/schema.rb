# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171221202152) do

  create_table "courses", force: :cascade do |t|
    t.integer "year"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.integer "min_grade"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade"
    t.integer "exam_id"
    t.integer "pupil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_grades_on_exam_id"
    t.index ["pupil_id"], name: "index_grades_on_pupil_id"
  end

  create_table "pupils", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "legajo"
    t.integer "dni"
    t.string "email"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_pupils_on_course_id"
  end

end
