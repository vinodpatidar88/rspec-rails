class CreateUserProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :user_profiles do |t|
      t.bigint :follower_count, null: false, default: 0
      t.bigint :following_count, null: false, default: 0
      t.integer :status, default: 0
      t.string :user_name
      t.string :website_url
      t.string :url
      t.timestamps
    end
  end
end
