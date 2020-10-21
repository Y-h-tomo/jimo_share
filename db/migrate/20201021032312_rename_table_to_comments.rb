class RenameTableToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :content, :comment
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
