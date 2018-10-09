class InvalidType < StandardError; end

class Edition
#what does an edition have?
#=> an edition has many characters (a list of characters)
attr_accessor :name 

def initialize
  @characters = []
end

def characters
  @characters.dup.freeze
end

def add_character(character)
  if !character.is_a?(Character)
    raise InvalidType, "must be a character"
  else
    @characters << character
end



end