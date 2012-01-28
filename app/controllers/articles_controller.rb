class ArticlesController < ApplicationController

  load_and_authorize_resource

  def index
    @articles = Article.search(params[:q])
  end

  def show
    @article.increase_count!
    render :layout => "lightbox" if params[:lightbox]
  end

  def new
  end

  def edit
  end

  def create
    @article = current_user.articles.build(params[:article])
    @article.set_status!(params[:publish], params[:draft])
    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => I18n.t("notice.article.created_successfully")) }
        format.js {}
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  def update
    params[:article][:tag_list] ||= []
    @article.set_status!(params[:publish], params[:draft])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => I18n.t("notice.article.updated_successfully")) }
        format.js {}
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  def destroy
    @article.destroy
    redirect_to(@article, :notice => I18n.t("notice.article.deleted_successfully"))
  end
end
