require 'bundler/setup'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 1300

get '/', :provides => :json do
  {:status => 'success', :info => "running", :framework => "sinatra", :stack => 'ruby', :stackversion => '2', :PackageManager => 'gem', :baseimageversion => "Alpine v3.4.6"}.to_json
end
