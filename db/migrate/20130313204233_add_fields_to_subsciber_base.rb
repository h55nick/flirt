class AddFieldsToSubsciberBase < ActiveRecord::Migration
  def change
    add_column :subscribers, :gender, :string
    add_column :subscribers, :age, :integer
    add_column :subscribers, :occupation, :string
    add_column :subscribers, :hobbies, :string
    add_column :subscribers, :tagline, :string
    add_column :subscribers, :bio, :string
  end
end
