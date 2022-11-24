require 'rack'
require './game'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'user' && password == 'qwerty'
end

run Game.new

