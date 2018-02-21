class TradesController < ApplicationController
  register Sinatra::Flash

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
    trade = Trade.create(params)
    trade.user_id = session[:user_id]
    trade.save
    trade_year = Year.find_or_create_by(year: params[:date][0..4].to_i)
    useryear = UserYear.find_or_create_by(user_id: current_user.id, year_id: trade_year.id)

    redirect to '/trades'
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
    if @trade.user_id == current_user.id
      erb :'/trades/edit'
    else
      flash[:message] = "You don't have access to this request."
      redirect to '/trades/private'
    end
  end

  patch '/trades/:id' do
    trade = Trade.find(params[:id])
    trade.update(coin: params[:coin], quantity: params[:quantity], buy_value_fiat: params[:buy_value_fiat], sell_value_fiat: params[:sell_value_fiat], date: params[:date], viewable: params[:viewable], notes: params[:notes])

    redirect "/trades/#{trade.id}"
  end
end
