require 'spec_helper'

describe 'Subscribers' do

=begin

  describe 'Post /subscribers' do
      it 'should add a subscription plan',js:true do
        login_to_system_as_sub_wo_subscription
        add_subscriptions
        page.should have_button('Free')
        click_button("Free")
        page.should have_link("Profile")
        page.should_not have_button("Free")
      end
  end
=end


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
      page.should have_button('Create User')
      page.should have_link('Cancel')
    end
  end

  describe 'POST /subscribers' do
        it 'creates a new subscriber', :js => true do
            #Set
            visit root_path
            click_link('Register')
            fill_in('Username',:with=>'Bob')
            fill_in('Email',:with=>'Bob@gmail.com')
            fill_in('user_password',:with=>'a')
            fill_in('user_password_confirmation',:with=>'a')
            click_button('Create User')

            #Tests
            page.should have_text('You have created an account')
            page.should_not have_button('Create User')
            expect(Subscriber.first.user.username).to eq 'Bob'
        end
        it 'it does not create a new subscriber due to failing validation', :js => true do
            visit root_path
            click_link('Register')
            click_button('Create User')
            page.should have_button('Create User')
            page.should have_text('Please fix these 3 errors')
      end
  end


  describe 'JS cancel_subscriber_form()' do
    it 'removes create subsciber form', js: true do
      visit root_path
      click_link('Register')
      click_link('Cancel')
      page.should_not have_button('Create User')
    end
  end

describe ' Post /login' do
      it 'the subscriber can view a list of subscription options',js: true do
        login_to_system_as_sub_wo_subscription
        add_subscriptions
        page.should have_button('Free')
        visit root_path
        page.should have_button('Free')
      end
      it 'the subscriber does not see list of subscriptions if already owns', js: true do
        login_to_system_as_subscriber_with_a_subscription
        add_subscriptions
        page.should_not have_button('Free')
        visit root_path
        page.should_not have_button('Free')
      end
      it 'the admin does not see a list of subscriptions', js: true do
      end
end
end

def add_subscriptions
  ["Free","Basic"].each do |name|
      Subscription.create(plan:name)
  end
end

def login_to_system_as_sub_wo_subscription
            user = User.create(email:'bob@gmail.com',username:'Bob',password:'a',password_confirmation:'a')
            subscriber = Subscriber.create(:tagline=>'a',gender:"m",age:10)
            subscriber.user = user
            visit root_path
            click_link('Login')
            fill_in('Email', :with => user.email)
            fill_in('Password', :with => 'a')
            click_button('Login')
end
def login_to_system_as_subscriber_with_a_subscription
  user = User.create(email: 'bob@gmail.com', username: 'Bob', password: 'a', password_confirmation: 'a')
  subscriber = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
  subscription = Subscription.create
  subscriber.subscription = subscription
  subscriber.save
  visit root_path
  click_link('Login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'a')
  click_button('Login')
end

def login_to_system_as_admin
  user = User.create(email: 'bob@gmail.com', username: 'Bob', password: 'a', password_confirmation: 'a')
  admin = Administrator.create(role: 'dba')
  admin.user = user
  visit root_path
  click_link('Login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'a')
  click_button('Start Flirting')
end
