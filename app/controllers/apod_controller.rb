class ApodController < ApplicationController
  API_KEY = 'OoiyIsfU02IFuP9QBSZD38VBEy6BSHDyHUYDtfm2'
  def index
    response = HTTP.get('https://api.tronalddump.io/random/quote')
    quote_resp = JSON.parse(response.body)
    date = Time.parse(quote_resp["appeared_at"]).to_date
    @text= quote_resp["value"]
    puts date
    @nasa_resp = HTTP.get("https://api.nasa.gov/planetary/apod?date=#{date}&api_key=#{API_KEY}")
    @url = JSON.parse(@nasa_resp.body)["url"]
  end
end
