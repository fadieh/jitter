class Cheep

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :username, String

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password

end

