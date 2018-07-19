class PeopleController < ApplicationController

  def index
    @person = Person.find(1)
    json_response(@person)
  end

  # def find_entry(url)
  #     url_arr = url.split('/')
  #     class_type = url_arr[-2].capitalize
  #     id = url_arr[-1]
  #     @entry = class_type.find(id)
  #     json_response(@entry)
  # end
end
