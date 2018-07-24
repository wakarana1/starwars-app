require 'rails_helper'

RSpec.describe "StarWarsAPI", type: :request do

  describe "find_or_fetch" do
    let(:person) { FactoryBot.create(:person) }

    it 'saves the person into the database' do
      StarWarsAPI.new.find_or_fetch("https://swapi.co/api/people/2")
      expect(Person.find(2).name).to eq "C-3PO"
    end

    it 'finds "person" if it already exists' do
      person
      StarWarsAPI.new.find_or_fetch("https://swapi.co/api/people/1")
      expect(StarWarsAPI.new.find_or_fetch("https://swapi.co/api/people/1").name).to eq person.name
    end
  end
end
