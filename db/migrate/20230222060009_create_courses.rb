class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :sub1
      t.string :sub2

      t.timestamps
    end
  end
end
