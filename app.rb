require "sinatra"
require "sinatra/reloader" if development?

require "./lib/caesar_cipher"

get "/" do
  shift_factor = params["shift_factor"].to_i
  message      = params["message"] || ""
  encrypt      = params["encrypt"]

  processed_message = if encrypt
                        CaesarCipher.encrypt(message, shift_factor)
                      else
                        CaesarCipher.decrypt(message, shift_factor)
                      end

  erb :index, locals: { processed_message: processed_message, encrypt: encrypt }
end
