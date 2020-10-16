class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    remove_column :users, :password,:string
  end
end
