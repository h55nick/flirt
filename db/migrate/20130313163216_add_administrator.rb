class AddAdministrator < ActiveRecord::Migration
  def change
    remove_columns :users, :subscriber_id
    add_column :users, :userable_id, :integer
    add_column :users, :userable_type, :string
  end
end
