class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories
  
  def load_categories
    @categories = Category.includes(:articles).order("name ASC")
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t(:access_denied)
    redirect_to root_url
  end
end
