require 'spec_helper'

describe 'administrator' do
  describe '.new' do
      it 'creates an instance of Administrator' do
        administrator = Administrator.new
        expect(administrator).to be_an_instance_of(Administrator)
      end

  end

  describe '#user' do
    it 'has a user ' do
        administrator = Administrator.new
        user = User.new
        administrator.user = user
        expect(administrator.user).to be_an_instance_of(User)

    end
  end

    describe '.create' do
          it 'has an id' do
            administrator = Administrator.create
            expect(administrator.id).to_not be nil
          end
      end

end


