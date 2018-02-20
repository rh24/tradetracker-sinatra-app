require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret' # Review sessions
  end

  get '/' do
    erb :homepage
  end

  get '/error' do
    erb :error
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
