class PeopleController < ApplicationController
  # get people/
  def index
    @people = Person.all
    render json: @people
  end
end
