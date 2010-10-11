class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show,:index]
  

  
  def index
    
    options = {
      :order => 'name DESC'
      
    }
    
    if params[:term]
      options[:conditions] = [
        "description LIKE :term",
        {:term => "%#{params[:term]}%"}
        ]

    end
    
    @articles = Article.find(:all,options)
  end

  def show
    @article = Article.find(params[:id])
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
  end
end
