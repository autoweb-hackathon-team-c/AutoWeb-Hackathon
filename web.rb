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

YUMAKE_KEY = '74b582a3f26c0532048be90d924f2225'

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
    key: YUMAKE_KEY,
    format: 'json',
    lat: params['lat'],
    lon: params['lon']
  }
  uri.query = URI.encode_www_form(query)
  json = open(uri, &:read)
  json JSON.parse(json)
end

# http://localhost:5000/light.json?lon=134.207916667&lat=35.5126777778&datetime=2016-01-31T17:24:00%2B09:00

get '/light.json' do
  datetime = DateTime.parse(params['datetime'])

  uri = URI.parse('http://api.yumake.jp/1.0/sun.php')
  query = {
    key: YUMAKE_KEY,
    format: 'json',
    lat: params['lat'],
    lon: params['lon'],
    date: datetime.strftime('%Y%m%d')
  }
  uri.query = URI.encode_www_form(query)
  result = JSON.parse(open(uri, &:read))

  sunset_datetime = DateTime.parse(result['sunset'])
  result['light'] = datetime >= sunset_datetime - Rational(30, 24 * 60)
  json result
end
