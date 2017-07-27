require "sinatra"
require "sinatra/reloader" if development?

get "/" do
  shift_factor = params["shift_factor"].to_i
  message      = params["message"] || ""

  encripted_message = encript(message, shift_factor)

  erb :index, locals: { encripted_message: encripted_message }
end

def encript(message, shift_factor)
  lowercase       = [*(65..90)]
  uppercase       = [*(97..122)]
  character_bytes = [lowercase, uppercase]
  new_message     = ""

  message.each_byte do |character|
    character_array = build_character_array(character_bytes, character)
    new_character = find_new_character(character_array, character, shift_factor)
    new_message << new_character.chr
  end

  new_message
end

# Select only the sub array that contains 'character' to keep the same case.
def build_character_array(character_bytes, character)
  character_bytes
    .select { |sub_array| sub_array.include?(character) }
    .flatten
end

def find_new_character(character_array, character, shift_factor)
  # If the array is empty then 'character' is not a letter.
  return character if character_array.empty?

  character_position      = character_array.index(character)
  character_array_rotated = character_array.rotate(shift_factor)
  character_array_rotated[character_position]
end
