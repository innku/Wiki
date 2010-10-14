class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show,:index]
  
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

end
