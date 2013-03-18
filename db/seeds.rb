User.delete_all

User.create(:username => "admin",:email=>"admin@gmail.com",:password=>'abc123', :password_confirmation=>'abc123')
User.create(:username => "user",:email=>"user@gmail.com",:password=>'abc123', :password_confirmation=>'abc123')
User.create(:username => "Nick",:email=>"h55nick@gmail.com",:password=>'aa', :password_confirmation=>'aa' )

  ["Free","Basic"].each do |name|
      Subscription.create(plan:name)
  end