
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

    describe '.create' do
          it 'has an id' do
            subscriber = Subscriber.create
            expect(subscriber.id).to_not be nil
          end
      end

end


