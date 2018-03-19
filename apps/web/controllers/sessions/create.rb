module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(_)
      user = UserRepository.new.find_by_email(requested_email)

      if !user.nil? && password_correct?(user)
        session[:user_id] = user.id
        redirect_to routes.homes_path
      else
        redirect_to routes.new_session_path
      end
    end

    private

    def password_correct? user
      BCrypt::Password.new(user.password) == requested_password
    end

    def requested_email
      params.dig(:session, :email) || params.dig(:user, :email)
    end

    def requested_password
      params.dig(:session, :password_plain)
    end

    def authenticate!; end
  end
end
