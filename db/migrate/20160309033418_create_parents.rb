class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
