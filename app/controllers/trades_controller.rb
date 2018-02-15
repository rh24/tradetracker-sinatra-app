class TradesController < ApplicationController

  get '/trades' do
    @user = current_user
    if logged_in?
      erb :'/trades/index'
    else
      redirect to '/login'
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
