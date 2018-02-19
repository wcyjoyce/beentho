class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :email
      t.date :start_date
      t.date :end_date
      t.integer :adults
      t.integer :children
      t.string :purpose
      t.string :preferences
      t.integer :budget
      t.string :asia
      t.string :memorable
      t.string :other
      t.timestamps
    end
  end
end
