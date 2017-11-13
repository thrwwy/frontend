require 'rubygems'
require 'sinatra'
require 'rest-client'
require 'json'

configure { set :server, :puma }

get '/' do
  "It is #{Time.now}"
end

get '/data' do
  RestClient.get "http://backend/retrieve"
end

get '/status' do
  status 200
end
