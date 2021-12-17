class ApiController < ApplicationController
  def index
  	render json: {:status => 'success', :info => "running", :framework => "rails", :stack => 'ruby'}
  end
end
