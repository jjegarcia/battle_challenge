require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player1 = $player_1
    @player2 = $player_2
    erb :play
  end

  get '/attack' do
    @player1 = $player_1
    @player2 = $player_2
    @player2.receive_damage
    erb :attack
  end
end
