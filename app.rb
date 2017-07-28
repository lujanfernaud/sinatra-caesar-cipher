require "sinatra"
require "sinatra/reloader" if development?

require "./lib/caesar_cipher"

get "/" do
  shift_factor = params["shift_factor"].to_i
  message      = params["message"] || ""

  encrypted_message = encrypt(message, shift_factor)

  erb :index, locals: { encrypted_message: encrypted_message }
end
