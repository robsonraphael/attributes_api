require 'sinatra/base'
require_relative 'controllers/attributes_controller'

# General class
class App < Sinatra::Base
  include Attributes

  get '/' do
    '<h1>Gerar Atributos...</h1>'
  end

  get '/basic' do
    Basic.new
    Basic.info
  end

  get '/basic/:level' do |level|
    Basic.new(level.to_i)
    Basic.info
  end

  get '/basic/update/:level' do |level|
    Basic.new.update(level.to_i)
    Basic.info
  end

  get '/force' do
    Force.new
    Force.info
  end

  get '/force/:level' do |level|
    Force.new(level.to_i)
    Force.info
  end

  get '/force/update/:level' do |level|
    Force.new.update(level.to_i)
    Force.info
  end
end
