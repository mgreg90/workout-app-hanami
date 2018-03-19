module Web::Controllers::Users
  class Create
    include Web::Action

    params do
      required(:user).schema do
        required(:email).filled(:str?)
        required(:password).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @user = CreateUser.new.call(params[:user])
      end
      redirect_to routes.homes_path
    end

  end
end
