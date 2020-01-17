class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_08e57dc64ab94816b4e7b5163daa4c65')
    if params[:ticker] == ""
      @nothing = "銘柄が入力されていません"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
      rescue StandardError
        @stock = nil
      end
      if !@stock
        @error = "銘柄が存在しません。もう一度入力してください"
      end
    end
  end

  def about

  end

end
