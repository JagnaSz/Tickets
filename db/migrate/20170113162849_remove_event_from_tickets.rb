class RemoveEventFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :event_id # will also remove the index
  end
end
