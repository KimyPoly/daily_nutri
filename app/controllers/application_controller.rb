class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    dashboard_path
  end
end
