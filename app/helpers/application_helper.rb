module ApplicationHelper

    def is_auth
      @auth.present?
    end
    def is_admin
      is_auth ? @auth.is_admin : false
    end
end
