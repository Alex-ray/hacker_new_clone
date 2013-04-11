class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :email
      u.string :user_name
      u.string :password_hash
      u.timestamps
    end
  end
end
