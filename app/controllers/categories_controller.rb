class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @categories = Category.all

  end

  def show
    
  end

  def new
  end

  def edit
  end

  def create
    if @category.save
      redirect_to(@category, :notice => I18n.t("notice.category.created_successfully")) 
    else
      render :action => "new" 
    end
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to(@category, :notice => I18n.t("notice.category.updated_successfully")) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @category.destroy
    redirect_to(categories_url, :notice => I18n.t("notice.category.deleted_successfully"))
  end
end
