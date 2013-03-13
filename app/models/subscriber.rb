# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscriber < ActiveRecord::Base
  has_one :user, :as => :userable
end
