class YearsController < ApplicationController
  register Sinatra::Flash

  get '/years' do
    if logged_in?
      erb :'/years/index'
    else
      redirect to '/login'
    end
  end

  get '/years/:year' do
    @year = Year.find_by(year: params[:year])
    @trades = Trade.all.select { |t| t.date.include?(@year.year.to_s) }
    erb :'/years/show'
  end
end
