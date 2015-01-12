class ChatController < WebsocketRails::BaseController
	def initialize_session

	end

	def new_message
		new_message = { message: 'this is a message'}
		send_message :new_message_event, new_message
	end
	
end
