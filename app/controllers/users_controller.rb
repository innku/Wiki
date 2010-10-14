class UsersController < ApplicationController
  
  before_filter :find_user, :only => :show
  authorize_resource
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(@article, :notice => 'User was successfully created.') 
    else
      render :action => "new"
    end
  end
  
  def show
  end
  
  private 
  def find_user
    @user = current_user
  end

end
