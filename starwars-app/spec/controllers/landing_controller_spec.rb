require 'rails_helper'

RSpec.describe LandingController, type: :controller do

  describe 'GET index' do
    let (:person) { FactoryBot.create(:person) }
    it "returns success when it finds user" do
      get :index, params: { :url => "https://swapi.co/api/people/1" }
      expect(response).to be_success
    end
  end

  describe '#find_entry' do
    let (:person) { FactoryBot.create(:person) }
    it 'returns user when found' do
      entry = controller.find_entry(Person, 1)
      puts entry
      expect(entry).to eq person
    end
  end

  describe '#create_entry' do
    it 'creates an object' do

      controller.create_entry("https://swapi.co/api/planets/1", Planet, 1)
      expect(Planet).to receive(:create)
    end
  end
end
