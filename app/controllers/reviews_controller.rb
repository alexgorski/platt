class ReviewsController < ApplicationController
  def new
   @review = Review.new(params[:review])
  end
  def create

    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      render 'new'
    end
  end

  def index
    if current_user
    @reviews = Review.where(:user_id => current_user.id, :date_dined => (Time.now - 100.years)..Time.now)
    else
    redirect_to new_user_path
    end
  end
  
  def show
    if current_user.reviews(params[:id].to_i)
      @review = Review.find(params[:id])
    else
      redirect_to reviews_path
    end
  end
  
  def edit
    if current_user.reviews(params[:id].to_i)
      @review = Review.find(params[:id])
    else
      redirect_to reviews_path
    end
  end
  
  def update   
    @review = Review.find(params[:id])
      if @review.update_attributes(params[:review])
        redirect_to action: :show, id: @review.id
      else
        render 'edit'
      end
  end


end
