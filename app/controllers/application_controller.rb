class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/401.html", :status => 401
  end

  def authenticate_inviter!
    authorize! :create, User
    current_user
  end
end
