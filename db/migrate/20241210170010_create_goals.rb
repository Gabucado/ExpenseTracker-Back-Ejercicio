class CreateGoals < ActiveRecord::Migration[8.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :target_amount
      t.integer :current_ammount
      t.date :due_date

      t.timestamps
    end
  end
end
