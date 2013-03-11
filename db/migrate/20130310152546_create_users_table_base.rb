class CreateUsersTableBase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #Base User Table
      t.string :name
      t.string :email
      t.boolean :is_admin
      t.string :password_digest
      t.timestamps
    end
  end
end
