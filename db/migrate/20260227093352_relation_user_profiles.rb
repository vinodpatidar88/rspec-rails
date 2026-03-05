class RelationUserProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :user_profiles, :user_id, :integer, null: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
