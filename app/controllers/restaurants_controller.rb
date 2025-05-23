class RestaurantsController < ApplicationController

def index
    
    @restaurants = Restaurant.all
end

def show
    
    @restaurant = Restaurant.find(params[:id])
end

def new
    @restaurant = Restaurant.new
end

def create
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save
        redirect_to restaurants_path(@restaurant)
    else
        render "new", status: :unprocessable_entity
    end
    
end

private

def strong_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end

end
