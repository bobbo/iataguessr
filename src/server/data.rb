require 'csv'

class Airport

    def initialize(name, code)
        @name = name
        @code = code
    end

    def as_hash()
        return { :name => @name, :code => @code }
    end

end

class Airports 

    @@airports_data_path = './data/airport-codes.csv'

    def initialize()
        @airports = []
        airports_data = CSV.parse(File.read(@@airports_data_path), headers: true)
        
        for data in airports_data do
            # Skip any airports without a valid IATA code
            if data['iata_code'] == nil 
                next
            end

            @airports.push(Airport.new(data['name'], data['iata_code']))
        end
    end

    def get_all() 
        return @airports.map { |a| a.as_hash }
    end

    def get_random(count)
        return @airports.sample(count).map { |a| a.as_hash }
    end

end