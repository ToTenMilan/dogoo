class Searches::DogsController < ApplicationController
  def index
    @breed = params[:breed] || 'rottweiler'

    data = DogApi.random_dog_image_by_breed(@breed)

    @image_url = data[:image_url]
    @status = data[:status]

    respond_to do |format|
      # FORM is not processed as TURBO_Stream format


      format.turbo_stream { render turbo_stream: turbo_stream.replace('breed_image_result', partial: 'searches/dogs/result' ) }
      format.html { render :index }
    end
  end
end
