class Searches::DogsController < ApplicationController
  def index
    @breed = params[:breed]
    # data = ::DogApi::FetchDogImageByBreed.new(@breed)
    data = DogApi.random_dog_image_by_breed(@breed)

    @image_url = data[:image_url]
    @status = data[:status]

    render :index
  end
end
