class CreateUsersTableBase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #Base User Table
      t.string :username
      t.string :email
      t.integer  :subscriber_id
      t.string :password_digest
      t.timestamps
    end
  end
end
