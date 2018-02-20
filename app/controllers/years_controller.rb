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
    if logged_in? && !!@year
      @trades = Trade.all.select { |t| t.date.include?(@year.year.to_s) }
    elsif !logged_in?
      redirect to '/login'
    else
      flash[:message] = "No available records for this year."
      redirect to '/error'
    end
  end
end
