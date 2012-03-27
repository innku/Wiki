class HomeController < ApplicationController
  def index
    @recent_articles  = Article.most_recent(3)
  end
end
