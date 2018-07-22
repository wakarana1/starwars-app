class LandingController < ApplicationController

  def index
    @person = Person.find(1)
    json_response(@person)
  end

end
