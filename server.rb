env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/jitter_#{env}")

require './lib/cheeps'

DataMapper.finalize

DataMapper.auto_upgrade!