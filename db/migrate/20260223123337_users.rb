class Users < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.integer :status, null: false
      t.string :email, null: false
      t.string :mobile_number, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :mobile_number
  end
end
