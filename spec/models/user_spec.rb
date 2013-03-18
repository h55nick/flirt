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
    describe '#subscriber' do
        it 'returns a Subscriber object when user is subscriber' do
            user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
            s1 = Subscriber.create(tagline:"Change me",gender:"Select",age:10)
            s1.user = user
            expect(user.sub).to be_an_instance_of(Subscriber)
        end
        it ' does returns a Subscriber object (if @auth is admin)' do
            user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
            a1 = Administrator.create(role:'db')
            a1.user = user
            expect(user.sub).to be false
        end
    end

    describe '#admin' do
        it 'returns false when user is a subscriber' do
            user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
            s1 = Subscriber.create(tagline:"Change me",gender:"Select",age:10)
            s1.user = user
            expect(user.admin).to be false
        end
        it ' returns admin object when user is Administrator' do
            user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
            a1 = Administrator.create(role:'db')
            a1.user = user
            expect(user.admin).to be_an_instance_of(Administrator)
        end
    end

end
