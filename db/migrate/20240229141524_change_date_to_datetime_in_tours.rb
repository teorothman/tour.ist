class ChangeDateToDatetimeInTours < ActiveRecord::Migration[7.1]
  def change
    change_column :tours, :date, :datetime
  end
end
