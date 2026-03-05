class AddColumnUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :age, :integer, default: 0
    add_column :users, :password, :string, null: true
  end
end
