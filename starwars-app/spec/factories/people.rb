FactoryBot.define do
  factory :person do
    id 1
    name "Luke Skywalker"
    birth_year "19BBY"
    eye_color "blue"
    gender "male"
    hair_color "blond"
    height "172"
    mass "77"
    skin_color "fair"
    homeworld "https://www.swapi.co/api/planets/1/"
    films [
        "https://www.swapi.co/api/films/2/",
        "https://www.swapi.co/api/films/6/",
        "https://www.swapi.co/api/films/3/",
        "https://www.swapi.co/api/films/1/",
        "https://www.swapi.co/api/films/7/"
    ]
    species [
        "https://www.swapi.co/api/species/1/"
    ]
    starships [
        "https://www.swapi.co/api/starships/12/",
        "https://www.swapi.co/api/starships/22/"
    ]
    vehicles [
        "https://www.swapi.co/api/vehicles/14/",
        "https://www.swapi.co/api/vehicles/30/"
    ]
    url "https://www.swapi.co/api/people/1/"
    created "2014-12-09T13:50:51.644000Z"
    edited "2014-12-20T21:17:56.891000Z"
  end
end
