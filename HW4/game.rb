require "erb"
#require 'byebug'
require_relative 'pet'

class Game
  attr_reader :request, :path
  attr_accessor :pet

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path
    response.finish
  end

  def response
    case path
    when '/'
      rack_response('start.html.erb')

    when '/create_pet'
      name = request.params['name']
      return rack_response_redirect if name.nil? || name.delete(' ').length.zero?
      @pet = Pet.new(name)
      rack_response_redirect('/game')

    when '/game'
      return rack_response_redirect if pet.nil?
      rack_response('game.html.erb')  

    when '/give_food'
      return rack_response_redirect if pet.nil?
      if pet.life > 0
        pet.give_food
        rack_response('game.html.erb')
      else
        rack_response_redirect('/game_over')
      end

    when '/give_cure'
      return rack_response_redirect if pet.nil?
      if pet.life > 0
        pet.give_cure
        rack_response('game.html.erb')
      else
        rack_response_redirect('/game_over')
      end

    when '/give_water'
      return rack_response_redirect if pet.nil?
      if pet.life > 0
        pet.give_water
        rack_response('game.html.erb')
      else
        rack_response_redirect('/game_over')
      end

    when '/put_cave'
      return rack_response_redirect if pet.nil?
      if pet.life > 0
        pet.put_cave
        rack_response('game.html.erb')
      else
        rack_response_redirect('/game_over')
      end    

    when '/give_acorn'
      return rack_response_redirect if pet.nil?
      if pet.life > 0
        pet.give_acorn
        rack_response('game.html.erb')
      else
        rack_response_redirect('/game_over')
      end    

    when '/exit'
      @pet = nil
      rack_response('game_over.html.erb')
    else
      rack_response_redirect
    end
  end

  def rack_response(filename)
    Rack::Response.new(render(filename))
  end

  def render(filename)
    ERB.new(File.read("./views/#{filename}")).result(binding)
  end

  def rack_response_redirect(new_path = '/')
    Rack::Response.new do |response|
      response.redirect(new_path)
    end
  end

end







