class Quiz 

    # TODO: I don't think the default values work like I expect, find out how to do it
    def initialize(code, name, description, regions=nil, countries=nil, type=nil)
        @code = code
        @name = name
        @description = description
        @regions = regions
        @countries = countries
        @type = type
    end

    def code()
        return @code
    end

    def regions()
        return @regions
    end

    def countries()
        return @countries
    end

    def type()
        return @type
    end

    def as_hash()
        return { :code => @code, :name => @name, :description => @description }
    end

end

class QuizFilterer

    def initialize(quiz) 
        @quiz = quiz
    end

    def filter(airports)
        return airports.select{ |a| match?(a) }.map { |a| a.as_hash }
    end

    def match?(airport)
        valid = false

        region_ok = @quiz.regions != nil && @quiz.regions.include?(airport.region)
        country_ok = @quiz.countries != nil && @quiz.countries.include?(airport.country)

        if @quiz.type == nil 
            return region_ok || country_ok
        else 
            type_ok = @quiz.type == airport.type
            return (region_ok || country_ok) && type_ok
        end
    end

end

class QuizDefinitions 

    def initialize()
        @quizzes = [
            Quiz.new("uk", "UK Major Airports", "All large airports in the UK", nil, ["GB"], 'large_airport'),
            Quiz.new("scotland", "Scotland Major Airports", "All large airports in Scotland", ["GB-SCT"], nil, nil),
            Quiz.new("england", "England Major Airports", "All large airports in England", ["GB-ENG"], nil, nil),
        ]
    end

    def get_filter(code) 
        code_matches = @quizzes.select{ |q| q.code == code }
        if code_matches.count > 0 
            return QuizFilterer.new(code_matches[0])
        end

        return nil
    end

    def all_quizzes() 
        return @quizzes.map{ |q| q.as_hash }
    end

end
