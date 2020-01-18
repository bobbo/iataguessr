require 'csv'

class Airport

    def initialize(name, code, region)
        @name = name
        @code = code
        @region = region
    end

    def as_hash()
        return { :name => @name, :code => @code, :region => @region }
    end

    def region()
        return @region
    end

end

class Airports 

    @@airports_data_path = './data/airports.csv'

    def initialize()
        @airports = []
        airports_data = CSV.parse(File.read(@@airports_data_path), headers: true)
        
        for data in airports_data do
            # Skip any airports without a valid IATA code
            # TODO: Condition needs refactored based on what we do with different regions
            if data['iata_code'] == nil || (data['type'] != 'large_airport' || !data['iso_region'].include?('GB-'))
                next
            end

            @airports.push(Airport.new(data['name'], data['iata_code'], data['iso_region']))
        end

        p "Loaded " + @airports.count.to_s + " airports"
    end

    def random_airport()
        return @airports.sample(1).map { |a| a.as_hash }
    end

    def random_airport_from_region(region)
        return @airports.select { |a| a.region == region }.sample(1).map {| a | a.as_hash }
    end

    # TODO: Generate a regions list from airports list at startup, use for better region matching logic later
    def get_regions()
        regions = []
        for airport in @airports do
            if !regions.include?(airport.region)
                regions.push(airport.region)
            end
        end

        return regions
    end

end