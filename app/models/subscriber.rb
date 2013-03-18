# == Schema Information
#
# Table name: subscribers
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gender          :string(255)
#  age             :integer
#  occupation      :string(255)
#  hobbies         :string(255)
#  tagline         :string(255)
#  bio             :string(255)
#  subscription_id :integer
#  expires         :date
#

class Subscriber < ActiveRecord::Base
  attr_accessible :gender, :age,:occupation,:hobbies,:tagline,:bio,:expires
  has_one :user, :as => :userable
  belongs_to :subscription
  validates :tagline, :presence => true
  validates :gender, :presence => true
  validates :age, :numericality =>  { :only_integer => true}

  def has_subscription?
    self.subscription.present?
  end

end
