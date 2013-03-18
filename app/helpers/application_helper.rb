module ApplicationHelper

    def is_auth
      @auth.present?
    end
    def subscription_levels
      Subscription.all
    end

end
