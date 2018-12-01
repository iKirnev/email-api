class ApiController < ApplicationController
  def pipl
    unless request.query_string.blank?
      response = RestClient.get "https://api.pipl.com/search/?#{request.query_string}&key=#{ENV['pipl_key']}"
      @result = JSON.parse response.body
    end
  end
  end
