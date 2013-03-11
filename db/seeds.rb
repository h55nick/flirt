User.delete_all

User.create(:name => "admin",:email=>nil,:password=>'abc123', :password_confirmation=>'abc123', :is_admin=>true)
User.create(:name => "user",:email=>nil,:password=>'abc123', :password_confirmation=>'abc123', :is_admin=>false)
User.create(:name => "Nick",:email=>"h55nick@gmail.com",:password=>'aa', :password_confirmation=>'abc123', :is_admin=>true)