class Cheep

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :username, String

	property :favourites, Integer, :default => 0 

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password

	def like
		self.favourites += 1
		self.save
	end

end

