# require 'net/http'

# module DogApi
#   class FetchDogImageByBreed
#     ERROR_IMAGE = 'https://images.dog.ceo/breeds/maltese/n02085936_899.jpg'
#     attr_reader :image_url, :status

#     def initialize(breed)
#       @breed = breed
#       @image_url = nil
#       @status = nil
#       fetch_dog_image
#     end

#     private

#     def fetch_dog_image
#       url = URI.parse("https://dog.ceo/api/breed/#{@breed}/images/random")
#       response = Net::HTTP.get_response(url)

#       if response.is_a?(Net::HTTPSuccess)
#         @image_url = JSON.load(response.body)['message']
#         @status = 'success'
#       else
#         @image_url = ERROR_IMAGE
#         @status = 'error'
#       end
#     end
#   end
# end
