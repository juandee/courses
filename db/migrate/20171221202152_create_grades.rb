class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.references :exam, foreign_key: true
      t.references :pupil, foreign_key: true

      t.timestamps
    end
  end
end
