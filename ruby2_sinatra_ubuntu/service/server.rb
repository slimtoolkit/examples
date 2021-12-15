require 'bundler/setup'
require 'sinatra'
require 'json'

set :bind, '0.0.0.0'
set :port, 1300

get '/', :provides => :json do
  {:status => 'success',:message => 'Hello World!', :stack => 'ruby', :framework => 'sinatra'}.to_json
end
