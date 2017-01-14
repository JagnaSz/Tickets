class AddAgeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :age, :integer
  end
end
