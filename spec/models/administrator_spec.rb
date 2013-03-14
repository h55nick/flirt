# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string(255)
#  ssn        :string(255)
#  tel        :string(255)
#

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
            administrator = Administrator.create(role:'db')
            expect(administrator.id).to_not be nil
          end
          it 'should fail validation if no role provided' do
            administrator = Administrator.create
            expect(administrator.id).to be nil
          end
      end

    describe '#metadata' do
      it 'has administrator properties' do
        administrator = Administrator.create(role: 'db', ssn: '111-111', tel:'1-111-112-3222')
        expect(administrator.id).to_not be nil
        expect(administrator.role).to eq 'db'
      end
    end


end


