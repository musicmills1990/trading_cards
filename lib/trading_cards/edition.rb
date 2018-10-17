class Edition
  attr_accessor :name, :characters, :description
    @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
