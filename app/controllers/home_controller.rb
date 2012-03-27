class HomeController < ApplicationController
  def index
    @recent_articles  = Article.published.most_recent(3)
  end
end
