class AddSeatsNumberToEvents < ActiveRecord::Migration
  def change
    add_column :events, :seats_number, :integer
  end
end
