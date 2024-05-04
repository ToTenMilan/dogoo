class Searches::DogsController < ApplicationController
  def index
    @breed = params[:breed]
    dogs_fetcher = DogApiClient.new(@breed)
    @image_url = dogs_fetcher.image_url
    @status = dogs_fetcher.status

    render :index
  end
end
