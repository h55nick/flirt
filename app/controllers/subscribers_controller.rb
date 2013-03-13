class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
      Subscriber.create(params[:subscriber])
  end
end