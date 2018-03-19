module Web
  module Authentication
    def self.included(action)
      action.extend ClassMethods
      action.class_eval do
        before :authenticate!
        expose :current_user
      end
    end

    PUBLIC_ROUTES = [
      :new_session_path,
      :new_user_path,
      :users_path
    ]

    module ClassMethods

      def public_routes
        PUBLIC_ROUTES
      end

    end

    private

    def public_routes
      self.class.public_routes
    end

    def authenticate!
      redirect_to routes.new_session_path unless allowed?
    end

    def allowed?
      authenticated? || public_routes.any? do |route|
        routes.send(route) == params.env['REQUEST_PATH']
      end
    end

    def authenticated?
      !!current_user
    end

    def current_user
      @current_user ||= UserRepository.new.find_by_email(session[:user_id])
    end
  end
end
