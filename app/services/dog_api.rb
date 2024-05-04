class DogApi
  def self.random_dog_image_by_breed(breed)
    url = URI.parse("https://dog.ceo/api/breed/#{CGI.escape(breed.underscore)}/images/random")
    response = Net::HTTP.get_response(url)
    data = {}

    if response.is_a?(Net::HTTPSuccess)
      data[:image_url] = JSON.load(response.body)['message']
      data[:status] = 'success'
    else
      data[:image_url] = 'https://images.dog.ceo/breeds/maltese/n02085936_899.jpg'
      data[:status] = 'error'
    end

    data
  end
end
