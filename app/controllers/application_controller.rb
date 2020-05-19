class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    flash[:authorization_error] = "Not authorized"
    render file: "#{Rails.root}/public/403.html" , status: 403
  end
end
