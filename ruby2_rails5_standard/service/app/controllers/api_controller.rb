class ApiController < ApplicationController
  def index
  	render json: {:status => 'success', :info => "running", :framework => "rails", :frameworkversion => '5', :stack => 'ruby', :stackversion => '2', :PackageManager => 'gem', :baseimageversion => "Debian 9 (stretch)"}
  end
end
