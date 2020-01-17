require 'sinatra/base'

class Pages < Sinatra::Application

    get '/' do
        html :index
    end

    # https://gist.github.com/kinopyo/1303281
    def html(view)
        File.read(File.join(File.dirname(__FILE__), "..", "views", "#{view.to_s}.html"))
    end

end 
