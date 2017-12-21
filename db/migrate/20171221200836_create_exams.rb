class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.date :date
      t.string :title
      t.integer :min_grade
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
