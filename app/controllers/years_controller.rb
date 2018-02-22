class YearsController < ApplicationController
  register Sinatra::Flash

  get '/years' do
    years_with_trades =
      Trade.all.collect do |t|
        t.date[0..4].to_i
      end
    @years =
      years_with_trades.each do |y|
        Year.find_or_create_by(year: y)
      end

    if logged_in?
      erb :'/years/index'
    else
      redirect to '/login'
    end
  end

  get '/years/:year' do
    @year = Year.find_by(year: params[:year])
    if logged_in? && !!@year
      @trades = Trade.all.select { |t| t.date.include?(@year.year.to_s) }
      erb :'/years/show'
    elsif !logged_in?
      redirect to '/login'
    else
      flash[:message] = "No available records for this year."
      redirect to '/error'
    end
  end
end
