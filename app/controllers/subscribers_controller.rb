class SubscribersController < ApplicationController
  def new
    @user = User.new
  end

  def create
        @user = User.new(params[:user])
        if @user.save
            s1 = Subscriber.create(tagline:"Change me",gender:"Select",age:10)
            s1.user = @user
        end
  end

  def purchase
      plan = Subscription.where(plan:params[:plan]).first();
      @auth.sub.subscription = plan
      @auth.sub.expires = Time.now + (!plan.duration.nil? ? plan.duration : 0)
  end

end