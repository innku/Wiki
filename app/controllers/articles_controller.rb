class ArticlesController < ApplicationController
  
  load_and_authorize_resource
  
  def index
    @articles = Article.search(params[:q])
  end

  def show
    @article.increase_count!
  end

  def new
  end

  def edit
  end

  def create
    @article = current_user.articles.build(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.js {}
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  def update
    params[:article][:tag_list] ||= []
    
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.js {}
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  def destroy
    @article.destroy
    redirect_to(@article, :notice => 'Article was successfully deleted.')
  end
end
