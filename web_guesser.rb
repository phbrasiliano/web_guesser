require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(100)

get '/' do
  message = check_guess(params['guess']) 
  erb(:index, :locals => {:num => SECRET_NUM, message: message})

end

def check_guess(guess)
  secret_num = SECRET_NUM
  puts "that is the first guess #{guess}"
  if guess.is_a?(String) && guess.match(/^\d{1,2}$/) 
    guess = guess.to_i
    puts "that is the second guess #{guess}"
    case guess
    when secret_num
      return "You got it right, the secret number is #{secret_num}"
    when 0..secret_num-5
      return "Too low!"
    when secret_num-5..secret_num-1
      return "Low, but close."
    when secret_num+1..secret_num+5
      return "High, but close."
    when secret_num+5..99
      return "Too high!"
    end
  elsif guess == nil
    return ""
  end
  "#{guess} is not a valid input. Please try again."
end