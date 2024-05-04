class Searches::DogsController < ApplicationController
  def index
    @breed = params[:breed]
    # data = ::DogApi::FetchDogImageByBreed.new(@breed)
    data = DogApi.random_dog_image_by_breed(@breed)

    @image_url = data[:image_url]
    @status = data[:status]

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream { render turbo_stream: turbo_stream.replace('breed_image_result', partial: 'searches_dog_result' ) }
    end
  end
end
