class YearsController < ApplicationController
  register Sinatra::Flash

  get '/years' do
    if logged_in?
      erb :'/years/index'
    else
      redirect to '/login'
    end
  end
end
