class AddUserNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user_name, foreign_key: true
  end
end
