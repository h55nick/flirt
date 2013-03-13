require 'spec_helper'

describe 'Users' do
  describe '.new' do
    it 'creates an instance of User' do
        user = User.new
        expect(user).to be_an_instance_of(User)
    end


    it 'has name, email, password and password_confirmation' do
      subscriber = User.new(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(subscriber.username).to eq 'bob'
      expect(subscriber.email).to eq 'bob@gmail.com'
      expect(subscriber.password).to eq 'a'
      expect(subscriber.password_confirmation).to eq 'a'
    end
  end
  describe '.create' do
    it 'has an id' do
      user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end
  end


end
