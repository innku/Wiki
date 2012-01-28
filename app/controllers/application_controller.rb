class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories
  
  def load_categories
    @categories = Category.includes(:published)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      flash[:error] = t(:access_denied)
      redirect_to root_url
    else
      redirect_to new_user_session_url
    end
  end
end
