class SubscribersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      u1 = User.create(params[:user])
      s1 = Subscriber.create
      s1.user = u1
  end
end