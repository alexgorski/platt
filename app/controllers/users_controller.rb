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
  end

  def new_from_facebook
    @user = current_user
    render :layout => 'facebook_registration'
  end

  def create_from_facebook
    if @user_exists = User.where(:email => params[:user][:email]).first
      @user_exists.copy_identity_data(current_user)
      session[:user_id] = @user_exists.id
      @user_exists.update_attributes(params[:user])
      redirect_to @user_exists
    else
      @user = current_user
      @user.update_attributes(params[:user])
      redirect_to @user
    end
  end

  def facebook_auth
    auth_hash = request.env['omniauth.auth']
    user = User.from_facebook_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to finish_account_signup_path
  end
end
