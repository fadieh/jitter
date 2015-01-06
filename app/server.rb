require 'data_mapper'
require 'sinatra'
require './lib/cheeps'
require './lib/user'
require 'rack-flash'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative './controllers/application'
require_relative './controllers/cheeps'
require_relative './controllers/favourite'
require_relative './controllers/sessions'
require_relative './controllers/users'
require_relative './controllers/profile'

enable :sessions
set :session_secret, 'super secret'

set :public_folder, Proc.new { File.join(root, '..', 'public') }

use Rack::Flash