class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def login_required
    redirect_to('/') if current_user.blank?
  end
end
