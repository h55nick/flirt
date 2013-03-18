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


require 'spec_helper'

describe Subscriber do
  describe '.new' do
      it 'creates an instance of subscriber' do
        subscriber = Subscriber.new
        expect(subscriber).to be_an_instance_of(Subscriber)
      end
  end

  describe '#user' do
    it 'has a user ' do
        subscriber = Subscriber.new
        user = User.new
        subscriber.user = user
        expect(subscriber.user).to be_an_instance_of(User)

    end
  end
  describe '#expires' do
    it 'has an expiration date' do
        subscriber = Subscriber.create(:tagline=>'a',gender:"m",age:10)
        subscriber.expires = Date.current
        subscriber.save
        expect(subscriber.expires).to eq Date.current
    end
  end

    describe '.create' do
          it 'has an id' do
            subscriber = Subscriber.create(:tagline=>'a',gender:"m",age:10)
            expect(subscriber.id).to_not be nil
          end
          it 'fails validation if tagline, gender are not present and age is integer old' do
            subscriber = Subscriber.create
            expect(subscriber.id).to be nil
          end
      end

      describe '#has_subscription' do
          it 'subscriber has subscription' do
              subscriber = Subscriber.create(:tagline=>'a',gender:"m",age:10)
              subscription =Subscription.create
              subscriber.subscription = subscription
              subscriber.save
              expect(subscriber.has_subscription?).to eq true
          end
          it 'subscriber DNH subscription' do
              subscriber = Subscriber.create(:tagline=>'a',gender:"m",age:10)
              expect(subscriber.has_subscription?).to eq false

          end
      end


  describe '#metadata' do
    it 'has subscriber' do
      subscriber = Subscriber.create(gender:'m',age: 10 ,occupation:'n/a',hobbies:'',tagline:'aa',bio:'aa')
      expect(subscriber.hobbies).to eq ''
      expect(subscriber.gender).to eq 'm'
      expect(subscriber.age).to eq 10
    end

  end

end


