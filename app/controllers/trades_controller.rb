class TradesController < ApplicationController

  get '/trades' do
    @user = current_user
    @trades = Trade.all
    if logged_in?
      erb :'/trades/index'
    else
      redirect to '/login'
    end
  end

  post '/trades' do
    @trade = Trade.create(params)
    redirect to '/trades'
  end

  get '/trades/new' do
    if logged_in?
      erb :'/trades/new'
    else
      redirect to '/login'
    end
  end
end
