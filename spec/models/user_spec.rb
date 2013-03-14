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

require 'spec_helper'

describe 'Users' do
  describe '.new' do
    it 'creates an instance of User' do
        user = User.new
        expect(user).to be_an_instance_of(User)
    end


    it 'has name, email, password and password_confirmation' do
      user = User.new(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.username).to eq 'bob'
      expect(user.email).to eq 'bob@gmail.com'
      expect(user.password).to eq 'a'
      expect(user.password_confirmation).to eq 'a'
    end

  end
  describe '.create' do
    it 'has an id' do
      user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end

      it 'should fail validation if username or email is empty'do
          user = User.create( password: 'a', password_confirmation: 'a')
          expect(user.username).to be nil
      end
  end


end
