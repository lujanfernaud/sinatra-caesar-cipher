# Holds the logic for encrypting messages.
class CaesarCipher
  attr_reader :new_message

  LOWERCASE       = [*(65..90)].freeze
  UPPERCASE       = [*(97..122)].freeze
  CHARACTER_BYTES = [LOWERCASE, UPPERCASE].freeze

  def self.encrypt(message, shift_factor)
    new.encrypt(message, shift_factor)
  end

  def initialize
    @new_message = ""
  end

  def encrypt(message, shift_factor)
    message.each_byte do |character|
      character_array = build_character_array(character)
      new_character = find_new_character(character_array, character, shift_factor)
      new_message << new_character.chr
    end

    new_message
  end

  private

  # Select only the sub array that contains 'character' to keep the same case.
  def build_character_array(character)
    CHARACTER_BYTES
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
end
