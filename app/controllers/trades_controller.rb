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
    # params.each do |k, v|
    #   if
    binding.pry
    @trades = Trade.where(user_id: current_user.id)
    trade = Trade.create(params)
    trade.user_id = session[:user_id]
    trade.save
    if trade.viewable == true
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
