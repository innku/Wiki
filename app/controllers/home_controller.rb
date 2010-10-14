class HomeController < ApplicationController
  def index
    @article = Article.first(:order => ("hit_count DESC"))
  end

end
