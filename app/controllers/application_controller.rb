class ApplicationController < ActionController::API
  include Authenticable

  #  prepend_before_action :test

  # def test
  #   current_user
  #  end
end
