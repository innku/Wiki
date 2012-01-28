class UsersController < ApplicationController
  
  before_filter :find_user, :only => :show
  authorize_resource
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(root_url, :notice => I18n.t("notice.user.created_successfully"))
    else
      render :action => "new"
    end
  end
  
  def show
  end
  
  def update
    if current_user.update_attributes(params[:user])
        redirect_to(current_user, :notice => I18n.t("notice.user.updated_successfully"))
      else
        render :action => "edit" 
    end
  end
  
  private 

  def find_user
    @user = current_user
  end

end
