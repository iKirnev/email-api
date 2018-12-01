class ApiController < ApplicationController
  
  def pipl
    unless request.query_string.blank?
      response = RestClient.get("https://api.pipl.com/search/?#{request.query_string}&key=#{ENV['pipl_key']}")
      @result = JSON.parse response.body
    end
  end

  def fullcontact
    post_params = {}
    if !params[:domain].blank?
      post_params[:domain] = params[:domain]
    else
      post_params[:email] = params[:email] unless params[:email].blank?
      post_params[:phone] = params[:phone] unless params[:phone].blank?
      post_params[:twitter] = params[:twitter] unless params[:twitter].blank?
    end
    post_params[:domain] = params[:domain] unless params[:domain].blank?
    unless post_params.blank?
      response = RestClient.post("https://api.fullcontact.com/v3/#{post_params[:domain] ? 'company' : 'person'}.enrich",
      post_params.to_json,
      {
        :authorization => "Bearer #{ENV['fullcontact_key']}"
      })
      @result = JSON.parse response.body
    end
  end
end
