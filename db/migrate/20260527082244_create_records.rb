class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.date :date
      t.string :snack_name
      t.text :memo

      t.timestamps
    end
  end
end
