class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: { listings: @listings.as_json(except: [:created_at, :updated_at]) }
  end

  def show
    @listing = Listing.find(params[:id])
    render json: {listing: @listing.as_json(except: [:created_at, :updated_at])}
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    render json: @listing, status: :created
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    render json: @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:num_room)
  end
end

# created_at
# updated_at
#ok
