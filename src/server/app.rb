require 'sinatra/base'

require_relative "./routes/api.rb"
require_relative "./routes/pages.rb"

class App < Sinatra::Application 
    use Api
    use Pages

    enable :static
    set :public_dir, File.dirname(__FILE__) + '/../client'

    run!
end