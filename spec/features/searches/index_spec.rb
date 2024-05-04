require 'rails_helper'

class DogApiMock
  def self.random_dog_image
    {
      image_url: 'https://images.dog.ceo/breeds/bulldog/n02096585_10036.jpg',
      status: 'success'
    }
  end

  def self.not_found
    {
      status: "error",
      image_url: "https://images.dog.ceo/breeds/maltese/n02085936_899.jpg",
      code:404
    }
  end
end


RSpec.feature 'Searches::DogsController', type: :feature, js: true do
  context 'when the breed is found' do
    scenario 'searches dogs by breed' do
      allow(DogApi).to receive(:random_dog_image_by_breed).and_return(
        DogApiMock.random_dog_image
      )
      visit searches_dogs_path
      fill_in 'breed', with: 'bulldog'
      click_button 'Submit'

      expect(page).to have_content('bulldog')
      expect(page).to have_css('img')
    end
  end

  context 'when the breed is not found' do
    scenario 'searches dogs by breed', js: true do
      allow(DogApi).to receive(:random_dog_image_by_breed).and_return(
        DogApiMock.not_found
      )
      visit searches_dogs_path
      fill_in 'breed', with: 'belldog'
      click_button 'Submit'

      expect(page).to have_content('belldog')
      expect(page).to have_content("We don't have belldog images")
      expect(page).to have_css('img')
    end
  end
end
