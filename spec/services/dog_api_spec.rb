require 'rails_helper'

RSpec.describe DogApi do
  describe '.random_dog_image_by_breed' do
    let(:response_double) { instance_double('Net::HTTPSuccess', body: { 'message' => image_url, status: 'success' }.to_json) }

    context 'when the breed is found' do
      let(:breed) { 'bulldog' }
      let(:image_url) { 'https://images.dog.ceo/breeds/bulldog/n02096585_10036.jpg' }

      before do
        allow(Net::HTTP).to receive(:get_response).and_return(response_double)
        allow(response_double).to receive(:is_a?).with(Net::HTTPSuccess).and_return(true)
      end

      it 'returns the random dog image URL and success status' do
        result = DogApi.random_dog_image_by_breed(breed)
        expect(result[:image_url]).to eq(image_url)
        expect(result[:status]).to eq('success')
      end
    end

    context 'when the breed is not found' do
      let(:breed) { 'belldog' }
      let(:image_url) { 'https://images.dog.ceo/breeds/maltese/n02085936_899.jpg' }

      before do
        allow(Net::HTTP).to receive(:get_response).and_return(response_double)
        allow(response_double).to receive(:is_a?).with(Net::HTTPSuccess).and_return(false)
      end

      it 'returns the default dog image URL and error status' do
        result = DogApi.random_dog_image_by_breed(breed)
        expect(result[:image_url]).to eq(image_url)
        expect(result[:status]).to eq('error')
      end
    end
  end

  describe '.parse_breed' do
    context 'when the breed has more than one word' do
      it 'returns the breed with each word reversed and escaped' do
        breed = 'french bulldog'
        result = DogApi.parse_breed(breed)
        expect(result).to eq('bulldog/french')
      end
    end

    context 'when the breed has only one word' do
      it 'returns the breed' do
        breed = 'bulldog'
        result = DogApi.parse_breed(breed)
        expect(result).to eq('bulldog')
      end
    end
  end
end
