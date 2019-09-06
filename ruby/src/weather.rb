#!/usr/bin/env ruby
# CLI app that brings in current location weather

require 'json'
require 'uri'
require 'net/http'
require 'colorize'

def weather
  api_key = ENV['APIXU_API_KEY'] || "6510b92495fd472ca30155709172803&q"
  place = ARGV[0]
  weather = get_weather(api_key, place)
  output(weather)
end

def get_weather(api_key, place)
    uri = URI("https://api.apixu.com/v1/current.json?key=#{api_key}=#{place}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
end

def output(parsed)
  location_name = parsed["location"]["name"]
  temp = parsed["current"]["temp_c"]
  wind_speed = parsed["current"]["wind_kph"]
  humidity = parsed["current"]["humidity"]
  feels_like = parsed["current"]["feelslike_c"]
  visibility = parsed["current"]["vis_km"]
  puts "======================"
  puts "City: #{location_name}"
  temp > 15 ? (puts "Temp: " + "#{temp}°C".red) : (puts "Temp: " + "#{temp}°C".blue)
  feels_like > 15 ? (puts "Feels Like: " + "#{feels_like}°C".red) : (puts "Feels Like: " + "#{feels_like}°C".blue)
  puts "Humidity: #{humidity}%"
  puts "Wind Speed: #{wind_speed} kph"
  puts "Visibility: #{visibility} km"
  puts "======================"
end

usage = "usage:\n\tweather [place]\nexamples:\n\tweather stockholm\n\tweather cairo"
if ARGV.empty?
    puts usage
else
  weather
end
