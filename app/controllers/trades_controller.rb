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
    @trades = Trade.where(user_id: current_user.id)
    trade = Trade.create(params)
    trade.user_id = session[:user_id]
    trade.save
    trade_year = Year.create(year: params[:date][0..4].to_i)
    useryear = UserYear.create(user_id: current_user.id, year_id: trade_year.id)
    # trade.year = trade_year.year
    # binding.pry
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
