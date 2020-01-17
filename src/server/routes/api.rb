require 'sinatra/base'
require 'json'

require_relative '../data.rb'

class Api < Sinatra::Base

    airports = Airports.new

    get '/api/airport' do
        { :airports => airports.get_all }.to_json
    end

    get '/api/airport/random/:count' do
        count = params['count'].to_i
        { :airports => airports.get_random(count) }.to_json
    end

end