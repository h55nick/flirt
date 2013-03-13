module ApplicationHelper

    def is_auth
      @auth.present?
    end
end
