class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
        t.string :artist
        t.text :description
        t.decimal :price_low
        t.decimal :price_high
        t.datetime :event_date
      t.timestamps null: false
    end
  end
end
