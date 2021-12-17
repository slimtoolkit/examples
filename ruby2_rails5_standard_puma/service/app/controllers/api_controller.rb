class ApiController < ApplicationController
  def index
  	render json: {:status => 'success', :message => "Hello World!", :framework => "rails", :stack => 'ruby'}
  end
end
