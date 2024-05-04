class Searches::DogsController < ApplicationController
  def index
    @breed = params[:breed]
    data = ::DogApi::FetchDogImageByBreed.new(@breed)

    @image_url = data.image_url
    @status = data.status

    render :index
  end
end
