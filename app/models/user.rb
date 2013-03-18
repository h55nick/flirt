# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  userable_id     :integer
#  userable_type   :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  belongs_to :userable,  :polymorphic => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :username, :presence => true
  has_secure_password

  def sub
    self.userable.is_a?(Subscriber) ? self.userable : false
  end

  def admin
    self.userable.is_a?(Administrator) ? self.userable : false
  end

end
