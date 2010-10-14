class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_categories
  
  def load_categories
    @categories = Category.includes(:articles).order("name ASC")
  end
end
