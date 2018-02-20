class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @trades = Trade.where(user_id: @user.id)
    @year_ids =
    UserYear.where(user_id: @user.id).collect do |user_year|
      user_year.year_id
    end
    # binding.pry
    if logged_in?
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :signup
    else
      redirect to '/trades'
    end
  end

  post '/signup' do
    user = User.create(params)
    session[:user_id] = user.id
    if user.save
      redirect to '/trades'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :login
    else
      redirect to '/trades'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if !!user
      session[:user_id] = user.id
      redirect to '/trades'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      erb :logout
    else
      redirect to '/login'
    end
  end

  post '/logout' do
    session.clear
    redirect to '/login'
  end
end
