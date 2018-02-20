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
    trade_year = Year.find_or_create_by(year: params[:date][0..4].to_i)
    useryear = UserYear.find_or_create_by(user_id: current_user.id, year_id: trade_year.id)
    # binding.pry
    @years = Year.where()
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

  get '/trades/:id' do
    @trade = Trade.find_by(id: params[:id])
    @user = User.find(@trade.user_id)
    # binding.pry
    erb :'/trades/show'
  end

  get '/trades/:id/edit' do
    @trade = Trade.find_by(id: params[:id])
    erb :'/trades/edit'
  end
end
