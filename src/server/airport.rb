require 'csv'

class Airport

    def initialize(name, code, region, type)
        @name = name
        @code = code
        @region = region
        @country = parse_country(region)
        @type = type
    end

    def parse_country(region) 
        split = region.split('-')
        if split.count > 0
            return split[0]
        end

        return region
    end

    def as_hash()
        return { :name => @name, :code => @code, :region => @region }
    end

    def region()
        return @region
    end

    def country()
        return @country
    end

    def type()
        return @type
    end

end

class Airports 

    @@airports_data_path = './data/airports.csv'

    def initialize()
        @airports = load_airports()

        p "Loaded " + @airports.count.to_s + " airports"
    end

    def load_airports()
        airports_data = CSV.parse(File.read(@@airports_data_path), headers: true)
        airports = []
        
        for data in airports_data do
            # Skip tiny airports and any airport without an IATA code
            if !(data['type'] == 'small_airport' || data['type'] == 'large_airport') || data['iata_code'] == nil
                next
            end

            airports.push(Airport.new(data['name'], data['iata_code'], data['iso_region'], data['type']))
        end

        return airports
    end

    def all()
        return @airports
    end

end