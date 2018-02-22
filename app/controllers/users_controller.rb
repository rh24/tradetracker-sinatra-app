class UsersController < ApplicationController
  register Sinatra::Flash

  get '/users' do
    if logged_in?
      erb :'/users/index'
    else
      flash[:message] = "You must be logged in to view this page."
      redirect to '/login'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    # binding.pry
    if !!@user
      @trades = Trade.where(user_id: @user.id)
      @year_ids =
      UserYear.where(user_id: @user.id).collect do |user_year|
        user_year.year_id
      end
    else
      flash[:message] = "This user does not exist."
      redirect to '/error'
    end
    # binding.pry
    if logged_in? && current_user.slug == params[:slug]
      erb :'/users/private_show'
    elsif logged_in?
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
      flash[:message] = "Please, fill in all fields with valid input."
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

  get '/users/:slug/delete' do
    user = User.find_by_slug(params[:slug])
    # binding.pry
    if !!user && current_user.id == user.id
      Trade.where(user_id: user.id).destroy_all
      UserYear.where(user_id: user.id).destroy_all
      User.where(id: user.id).destroy_all

      flash[:message] = "You have deleted your account."
      redirect to '/signup'
    elsif !!user && current_user.id != user.id
      flash[:message] = "Hey! You can't do that!"
      redirect to '/error'
    else
      flash[:message] = "User not found"
      redirect to '/error'
    end
  end
end
