class AddIndexToUsersUserid < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :userid, unique: true
  end
end
