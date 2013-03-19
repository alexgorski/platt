class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    
  end

  def create
  @user = User.new(params[:user])

    
    if @user.save
      session[:user_id] = @user.id
      redirect_to restaurants_path, notice: "Thank you for signing up"
    else
      render "new"
    end

  end
  def index
    @users = Users.all
  end

end
