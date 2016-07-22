require "./config/dependencies"
require "better_errors"

class App < Sinatra::Base

  # Provide a in browser REPL like binding.pry when you hit an exception
  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path(__dir__, "..")
  end

  # Expose any file stored in the folder to the internet
  # http://localhost:4567/css/example.css
  set :public_folder, File.dirname(__FILE__) + '/assets'

  # HTTP 4x does not support PUT PATCH DELETE, only GET and POST
  # this will support setting the method of the HTTP request with a
  # form input, with a name of _method
  # <input type="hidden" name="_method" value="PATCH">
  use Rack::MethodOverride

  get "/" do
    erb :"homepage.html"
  end

  run! if app_file == $PROGRAM_NAME
end
