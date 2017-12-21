class CreatePupils < ActiveRecord::Migration[5.1]
  def change
    create_table :pupils do |t|
      t.string :name
      t.string :surname
      t.string :legajo
      t.integer :dni
      t.string :email
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
