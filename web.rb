require 'sinatra'
require 'sinatra/json'
require 'rack/tracker'
require 'slim'
require 'sass'
require 'coffee-script'
require 'tilt/erb'
require 'tilt/sass'
require 'tilt/coffee'
require 'open-uri'
require 'uri'
require 'json'

configure :development do
  require 'sinatra/reloader'
  set :bind, '0.0.0.0'
  Slim::Engine.set_default_options pretty: true
end

get '/test' do
  cross_origin
  'This is available to cross-origin javascripts'
end

get '/weather.json' do
  uri = URI.parse('http://api.yumake.jp/1.0/forecastMsm.php')
  query = {
    key: '74b582a3f26c0532048be90d924f2225',
    format: 'json',
    lat: params['lat'],
    lon: params['lon']
  }
  uri.query = URI.encode_www_form(query)
  json = open(uri, &:read)
  json JSON.parse(json)
end
