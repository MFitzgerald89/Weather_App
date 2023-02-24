require "http"

system "clear"

while loop = true

puts "Welcome to my weather app!"
puts "Would you like to forecast some weather?"
input = gets.chomp 
if input == "Yes".downcase
  puts "What city would you like to forecast?"
  city_input = gets.chomp
  puts "What is your preferred measurement of temperature(celsius or fahrenheit)?"
  temp_input = gets.chomp
  if temp_input == "celsius"
    temp_input = "metric"
  elsif temp_input == "fahrenheit"
    temp_input = "imperial"
  end
  response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city_input}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=#{temp_input}")

  pp response.parse(:json)
  
elsif input == "No".downcase
   puts "Bye Felicia"
   loop = false
  break
end
end