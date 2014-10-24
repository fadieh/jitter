class Cheeps

	include DataMapper::Resource

	property :id, Serial
	property :message, Text
	property :username, String

end

