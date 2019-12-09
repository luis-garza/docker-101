#!/usr/bin/env ruby
# CLI app that brings in current location weather

require 'json'
require 'uri'
require 'net/http'
require 'colorize'

def weather
  api_key = "121334d8ae91ec91a6c3a446124b6898"
  place = ARGV[0]
  weather = get_weather(api_key, place)
  output(weather)
end

def get_weather(api_key, place)
    uri = URI("http://api.weatherstack.com/current?access_key=#{api_key}&query=#{place}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
end

def output(parsed)
  begin
    location_name = parsed["location"]["name"]
    temp = parsed["current"]["temperature"]
    wind_speed = parsed["current"]["wind_speed"]
    humidity = parsed["current"]["humidity"]
    feels_like = parsed["current"]["feelslike"]
    visibility = parsed["current"]["feelslike"]
    puts "======================"
    puts "City: #{location_name}"
    temp > 15 ? (puts "Temp: " + "#{temp}°C".red) : (puts "Temp: " + "#{temp}°C".blue)
    feels_like > 15 ? (puts "Feels Like: " + "#{feels_like}°C".red) : (puts "Feels Like: " + "#{feels_like}°C".blue)
    puts "Humidity: #{humidity}%"
    puts "Wind Speed: #{wind_speed} kph"
    puts "Visibility: #{visibility} km"
    puts "======================"
  rescue
    info = parsed["error"]["info"]
    puts "Error: #{info}"
  end
end

usage = "usage:\n\tweather [place]\nexamples:\n\tweather stockholm\n\tweather cairo"
if ARGV.empty?
    puts usage
else
  weather
end
