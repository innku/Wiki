class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show,:index]
  

  
  def index
    @articles = Article.search(params[:q])
  end

  def show
    @article = Article.find(params[:id])
    @article.increase_count!
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to(@article, :notice => 'Article was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    params[:article][:tag_list] ||= []
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to(@article, :notice => 'Article was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(@article, :notice => 'Article was successfully deleted.')
  end
end
