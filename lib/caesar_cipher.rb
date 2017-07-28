# Holds the logic for encrypting messages.
class CaesarCipher
  LOWERCASE       = [*(65..90)].freeze
  UPPERCASE       = [*(97..122)].freeze
  CHARACTER_BYTES = [LOWERCASE, UPPERCASE].freeze

  def self.encrypt(message, shift_factor)
    new.encrypt(message, shift_factor)
  end

  def self.decrypt(message, shift_factor)
    new.decrypt(message, shift_factor)
  end

  def initialize
    @new_message = ""
  end

  def encrypt(message, shift_factor)
    message.each_byte do |character|
      select_case_for(character)
      new_message << select_new(character, shift_factor)
    end

    new_message
  end

  def decrypt(message, shift_factor)
    message.each_byte do |character|
      select_case_for(character)
      new_message << select_new(character, - shift_factor)
    end

    new_message
  end

  private

  attr_reader :new_message, :characters

  # Select only the sub array that contains 'character' to keep the same case.
  def select_case_for(character)
    @characters = CHARACTER_BYTES
                  .select { |sub_array| sub_array.include?(character) }
                  .flatten
  end

  def select_new(character, shift_factor)
    # If @characters is empty then 'character' is not a letter.
    return character if characters.empty?

    character_position = characters.index(character)
    characters_rotated = characters.rotate(shift_factor)

    characters_rotated[character_position].chr
  end
end
