class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.integer :user_id
    	t.integer :cohort_id
    end
  end
end
