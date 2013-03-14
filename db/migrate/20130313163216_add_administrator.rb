class AddAdministrator < ActiveRecord::Migration
  def change
    add_column :users, :userable_id, :integer
    add_column :users, :userable_type, :string
  end
end
