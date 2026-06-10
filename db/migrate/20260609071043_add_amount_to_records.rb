class AddAmountToRecords < ActiveRecord::Migration[7.2]
  def change
    add_column :records, :amount, :integer, default: 1, null: false
  end
end
