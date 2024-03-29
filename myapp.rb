require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'digest/sha1'
require 'data_mapper'

configure do
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/default.db")
  
  class Wish
    include DataMapper::Resource
    property :id, Serial
    property :text, String
  end
  
  DataMapper.auto_migrate!
end

get '/fib/:number' do
  n = params[:number].to_i
  a, b = 0, 1
  n.times {a, b = b, a + b}
  content_type :json
  {:response => a}.to_json
end

get '/google-body' do
  response = Net::HTTP.get_response URI.parse('http://google.com')
  sha1 = Digest::SHA1.hexdigest response.body
  content_type :json
  {:response => sha1}.to_json
end

get '/store' do
  content_type :json
  {:response => Wish.last.text}.to_json
end

post '/store' do
  Wish.create(:text => params[:value])
  content_type :json
  {:response => Wish.last.text}.to_json
end
