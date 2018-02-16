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
    @trades = Trade.all
    trade = Trade.create(params)
    trade.user_id = session[:user_id]
    trade.save
    if trade.viewable = true
      redirect to '/trades'
    else
      erb :'/users/private_show'
    end
  end

  get '/trades/new' do
    if logged_in?
      erb :'/trades/new'
    else
      redirect to '/login'
    end
  end
end
