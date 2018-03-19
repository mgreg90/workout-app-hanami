require 'hanami/interactor'

class CreateUser
  include Hanami::Interactor

  def initialize
  end

  def call(user_attributes)
    user_attributes[:password_digest] = BCrypt::Password.create(user_attributes[:password])
    user_attributes.delete(:password)
    UserRepository.new.create(user_attributes)
  end

  private


end