class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

    #user = User.new(
    #    :email                 => "test1@khu.ac.kr",
    #    :password              => "123456",
    #    :password_confirmation => "123456"
    #)
    #user.skip_confirmation!
    #user.save!

  before_action :authenticate_user!

end
