class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end
  
  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect to '/trades'
    end
  end
end
