class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  #attr_protected :is_admin
  #The two lines above are 'base' equivilant - if you add more to users but
  #don't want to add to attr_accessible  toggle comments.

  attr_accessible :is_admin #delete after seed.
  #attr_reader :is_admin #don't allow writing unless in DB, but allow viewing. ### ENABLE AFTER SEEDING

  has_secure_password #password/password_confirmation to password_digest encryption (requires gem)


  #make her fat.
end
