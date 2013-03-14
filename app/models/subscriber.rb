# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gender     :string(255)
#  age        :integer
#  occupation :string(255)
#  hobbies    :string(255)
#  tagline    :string(255)
#  bio        :string(255)
#

class Subscriber < ActiveRecord::Base
  attr_accessible :gender, :age,:occupation,:hobbies,:tagline,:bio
  has_one :user, :as => :userable
  validates :tagline, :presence => true
  validates :gender, :presence => true
  validates :age, :numericality =>  { :only_integer => true}
end
