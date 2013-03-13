require 'spec_helper'

describe 'Subscribers' do

  describe 'Get /' do
    it 'displays register button' do
        visit root_path
        page.should have_link('Register')
    end
  end

  describe 'GET /subscribers/new' do
    it 'displays the create subscriber button', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Create Subscriber')
      page.should have_button('Cancel')
    end
  end

  describe 'POST /subscribers' do
    it 'creates a new subscriber', :js => true do
      #Set
      visit root_path
      click_link('Register')
      fill_in('Username',:with=>'Bob')
      fill_in('Email',:with=>'Bob@gmail.com')
      fill_in('subscriber_password',:with=>'a')
      fill_in('subscriber_password_confirmation',:with=>'a')
      click_button('Create Subscriber')

      #Tests
      page.should have_text('You have created an account')
      page.should_not have_button('Create Subscriber')
      expect(Subscriber.first.username).to eq 'Bob'
    end
  end


  describe 'JS cancel_subscriber_form()' do
    it 'removes create subsciber form', js: true do
      visit root_path
      click_link('Register')
      click_button('Cancel')
      page.should_not have_button('Create Subscriber')
    end
  end
end
