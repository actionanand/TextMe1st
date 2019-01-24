class CodesController < ApplicationController
  def new
    @result = Code.send(params[:operation].to_sym, params[:a])
    @names = Code.name(params[:operation].to_sym)
		render 'index'
  end

  def index
    
  end
  
  
end