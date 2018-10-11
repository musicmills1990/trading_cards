class Edition
#what does an edition have?
#=> an edition has many characters (a list of characters)
  attr_accessor :name, :characters
  @@all = []

  def initialize(name, characters_array)
    @name = name

    @characters = characters_array.collect do |character_attributes|
      Character.new(self, character_attributes)
    end

    @@all << self
  end

  def self.find(id)
    @@all[id.to_i - 1]
  end

  def self.find_character(id)
    self.characters[id.to_i - 1]
  end

  def self.all
    @@all
  end

  def self.print_all
    all.each_with_index do |edition, index|
      puts "#{index+1}. #{edition.name}"
    end
  end
end
