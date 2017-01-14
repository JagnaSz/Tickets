class AddForAdultsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :for_adults, :boolean, :default => false
  end
end
