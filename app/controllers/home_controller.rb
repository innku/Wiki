class HomeController < ApplicationController
  def index
    @articles = Article.order("hit_count DESC").limit(3)
  end

end
