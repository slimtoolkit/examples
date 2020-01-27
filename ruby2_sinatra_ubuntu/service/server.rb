require 'bundler/setup'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 1300

get '/', :provides => :json do
  {:status => 'success',:info => 'yes!!!', :stack => 'ruby', :framework => 'sinatra'}.to_json
end
