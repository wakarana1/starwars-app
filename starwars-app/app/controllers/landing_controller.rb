class LandingController < ApplicationController

  def index
    json_response(StarWarsAPI.new.find_or_fetch(params[:url]))
  end
end
