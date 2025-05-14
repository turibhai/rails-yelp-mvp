class ReviewsController < ApplicationController
  # def show
  
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = @restaurant.reviews
    
  # end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.Restaurant = @restaurant
    if @restaurant.save
      redirect_to restaruants_id_review_path(@restaurant)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require().permit(:rating, :content)
  end

end
