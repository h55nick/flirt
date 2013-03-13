require 'spec_helper'


describe "Session" do

    describe 'Get /' do
      it 'displays login link' do
          visit root_path
          page.should have_link('Login')
      end
    end



  describe 'GET /login' do
    it 'display login form', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Login')
      page.should have_button('Cancel')
    end
  end

  describe 'JS cancel_login_form()' do
    it 'removes login form', js: true do
      visit root_path
      click_link('Login')
      click_button('Cancel')
      page.should_not have_button('Login')
    end
  end

  describe 'POST /login' do
    let(:user) {User.create(email:'bob@gmail.com',username:'Bob',password:'a',password_confirmation:'a')}
    it 'logs the user into the system', :js=>true do
      visit root_path
=begin
      click_link('Register')
      fill_in('Username',:with=>'Bob')
      fill_in('Email',:with=>'Bob@gmail.com')
      fill_in('user_password',:with=>'a')
      fill_in('user_password_confirmation',:with=>'a')
      click_button('Create User')
=end

      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'a')
      click_button('Login')
      page.should_not have_button('Login')
    end

it 'incorrect login into the system', :js=>true do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => '2')
      click_button('Login')
      page.should have_button('Login')
    end

  end

  end
=begin
=end
