require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do 
    status 200
    @name = params[:name]
    body "#{@name.reverse}"
  end

  get '/square/:number' do
    status 200
    @number = params[:number].to_i
    body "#{@number.to_i.pow(2)}"
  end

  get '/say/:number/:phrase' do
    status 200
    @phrase = params[:phrase].split("%20").join(" ")
    @number = params[:number].to_i
    result = []
    @number.times do 
      result << @phrase
    end
    body "#{result}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    status 200
    rhyme_value = params.values
    body "#{rhyme_value.join(" ")}."
  end

  get '/:operation/:number1/:number2' do
    status 200
    result = nil
    if params[:operation] == "add"
      result = params[:number1].to_i + params[:number2].to_i
    elsif params[:operation] == "subtract"
      result = params[:number1].to_i - params[:number2].to_i
    elsif params[:operation] == "multiply"
      result = params[:number1].to_i * params[:number2].to_i
     elsif params[:operation] == "divide"
      result = params[:number1].to_i / params[:number2].to_i
     end
     body "#{result}"
  end
end