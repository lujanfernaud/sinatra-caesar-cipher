require "sinatra"
require "sinatra/reloader" if development?

get "/" do
  message = "Hello!"

  erb :index, locals: { message: message }
end
