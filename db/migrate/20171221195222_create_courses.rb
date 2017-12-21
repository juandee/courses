class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :year
      t.string :title

      t.timestamps
    end
  end
end
