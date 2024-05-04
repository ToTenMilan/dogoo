class DogApi
  def self.random_dog_image_by_breed(breed)
    parsed_breed = parse_breed(breed)
# binding.pry
    url = URI.parse("https://dog.ceo/api/breed/#{parsed_breed}/images/random")
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

  def self.parse_breed(breed)
    result = ''

    if breed.split(' ').size > 1
      result = breed.split(' ').reverse.each { |word| CGI.escape(word) }.join('/')
    else
      result = breed
    end

    result.downcase
  end
end
