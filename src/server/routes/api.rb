require 'sinatra/base'
require 'json'

require_relative '../data.rb'

class Api < Sinatra::Base

    airports = Airports.new

    get '/api/airport/random' do
        json({ :airports => airports.random_airport() })
    end

    get '/api/airport/:region/random' do
        region = params['region']
        json({ :airports => airports.random_airport_from_region(region) })
    end

    get '/api/region' do 
        json({ :regions => airports.get_regions() })
    end

    def json(data)
        return data.to_json
    end

end