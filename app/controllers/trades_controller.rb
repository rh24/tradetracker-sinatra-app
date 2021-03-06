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
    trade = current_user.trades.build(params)
    # What's the benefit of using user.association.build over Trade.create, then trade.user_id = current_user.id?
    if trade.save
      trade_year = Year.find_or_create_by(year: params[:date][0..4].to_i)
      useryear = UserYear.find_or_create_by(user_id: current_user.id, year_id: trade_year.id)
      redirect to '/trades'
    else
      flash[:message] = "Please, fill out fields with valid inputs."
      redirect to '/trades/new'
    end
    need_valid_input = [params[:coin], params[:quantity], params[:fiat_symbol], params[:buy_value_fiat], params[:sell_value_fiat], params[:viewable], params[:date]]
    if need_valid_input.include?("")
      flash[:message] = "Please, fill out fields with valid inputs."
      redirect to '/trades/new'
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
    if @trade == nil
      flash[:message] = "No record found."
      redirect to '/error'
    else
      @user = User.find(@trade.user_id)
    end
    if logged_in?
      if @trade.viewable != true && current_user.id != @trade.user_id
        flash[:message] = "You do not have access to this information."
        redirect to '/error'
      elsif @trade.viewable == true
        erb :'/trades/show'
      elsif @trade.viewable == false && current_user.id == @trade.user_id
        erb :'/trades/show'
      end
    else
      redirect to '/login'
    end
  end

  get '/trades/:id/edit' do
    @trade = Trade.find_by(id: params[:id])
    if @trade.user_id == current_user.id
      erb :'/trades/edit'
    else
      flash[:message] = "You don't have access to this request."
      redirect to '/trades'
    end
  end

  patch '/trades/:id' do
    trade = Trade.find(params[:id])
    if trade.user_id == current_user.id
      trade.update(coin: params[:coin], quantity: params[:quantity], buy_value_fiat: params[:buy_value_fiat], sell_value_fiat: params[:sell_value_fiat], date: params[:date], viewable: params[:viewable], notes: params[:notes])
      # RECREATE YEAR AND USERYEAR while deleting old date in trades/edit.erb view
      # in order to update `Years active: ` in users/private_show.erb
      trade_year = Year.find_or_create_by(year: params[:date][0..4].to_i)
      useryear = UserYear.find_or_create_by(user_id: current_user.id, year_id: trade_year.id)
      if trade.save
        redirect "/trades/#{trade.id}"
      else
        flash[:message] = "Please, fill out fields with valid inputs."
        redirect "/trades/#{trade.id}/edit"
      end
    else
      flash[:message] = "You can't do that!"
      redirect to '/login'
    end
  end

  get '/trades/:id/delete' do
    user = User.find(current_user.id)
    @trade = Trade.find(params[:id])

    @other_trades_made_by_user_in_that_year =
    current_user.trades.detect do |t|
      if t != @trade
        t.date == @trade.date[0..4].to_i
      end
    end

    @all_other_trades_made_in_that_year =
    Trade.all.detect do |t|
      if t != @trade
        t.date == @trade.date[0..4].to_i
      end
    end

    if logged_in? && current_user.id == @trade.user_id
      erb :'/trades/delete'
    else
      flash[:message] = "Unable to execute request."
      redirect to '/error'
    end
  end

  delete '/trades/:id' do
    trade = Trade.find(params[:id])
    trade.destroy
    UserYear
    flash[:message] = "You have successfully deleted your trade."
    redirect to '/trades'
  end
end
