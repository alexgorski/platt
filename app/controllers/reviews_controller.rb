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
    @reviews = Review.where(:user_id => current_user.id)

  end
  def show
    @review = Review.find(params[:id])
  end
  
  def edit

    @review = Review.find(params[:id])
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
