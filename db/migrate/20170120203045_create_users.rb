class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :password_digest
      t.integer :age
      t.timestamps null: false
    end
  end
end
