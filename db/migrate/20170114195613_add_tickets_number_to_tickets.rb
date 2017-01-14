class AddTicketsNumberToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :tickets_number, :integer
  end
end
