class ChangeDefaultAmountInRecords < ActiveRecord::Migration[7.2]
  def change
    change_column_default :records, :amount, from: 1, to: 2
  end
end
