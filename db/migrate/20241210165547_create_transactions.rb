class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :ammount
      t.text :description
      t.time :date

      t.timestamps
    end
  end
end
