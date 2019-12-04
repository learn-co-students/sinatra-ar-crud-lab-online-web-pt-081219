
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    'Hello, World!!'
  end
end


# leave this alone this is where we are are gonna store any configurations or information that will relate to any resource. it's modular and flexible. if we code everything here we then commit to only having one resource 