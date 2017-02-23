require 'sinatra'

get '/' do
  secret_num = rand(101)
  "Your secret number is #{secret_num}!"
end