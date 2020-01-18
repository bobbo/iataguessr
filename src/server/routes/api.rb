require 'sinatra/base'
require 'json'

require_relative '../airport.rb'
require_relative "../quiz.rb"

class Api < Sinatra::Base

    airports = Airports.new
    quizzes = QuizDefinitions.new

    get '/api/airport/:quiz/random' do
        quiz = params['quiz']
        quiz_filter = quizzes.get_filter(quiz)
        p quiz_filter

        if quiz_filter == nil 
            return json({ :failed => "Unknown quiz" })
        end

        json({ :airports => quiz_filter.filter(airports.all).sample(1) })
    end

    get "/api/quiz" do
        json({ :quizzes => quizzes.all_quizzes })
    end

    def json(data)
        return data.to_json
    end

end