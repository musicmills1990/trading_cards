class Edition
#what does an edition have?
#=> an edition has many characters (a list of characters)
  attr_accessor :name, :characters, :description
    @@editions = []

#  def initialize
#    @@editions << self
#  end

  def self.editions
    @@editions
  end

  def self.doc
    @doc ||= Nokogiri::HTML(open("https://musicthegathering.com"))
  end


  def self.scrape_details
    puts "Loading info now..."
     @@editions << self.scrape_mtg
     @@editions << self.scrape_craic
     @@editions << self.scrape_chaste
     @@editions << self.scrape_plunder
     @@editions << self.scrape_lady_v
    end


    def self.scrape_mtg
      Edition.new.tap do |e|
        Edition.doc.search("#music-the-gathering-cards-page").collect do |a|
          e.name = a.search("div#block-f11ba348dcafc96ca707.sqs-block.html-block.sqs-block-html h2").text
          e.characters = a.search("div.col.sqs-col-4.span-4 h3").to_a.join(", ")
          e.description = a.search("div.col.sqs-col-4.span-4 p").to_a.join(" ")
        end
      end
    end


    def self.scrape_craic
      Edition.new.tap do |e|
        Edition.doc.css("#the-craic-edition-cards-page").collect do |a|
          e.name = a.search("h2").text.strip.gsub("Buy All Four!", "")
          e.characters = a.search("div.col.sqs-col-6.span-6 h3").to_a.join(", ")
          e.description = a.search("div.col.sqs-col-6.span-6 p").to_a.join(" ")
        end
      end
    end

    def self.scrape_chaste
      Edition.new.tap do |e|
        Edition.doc.css("#chaste-treasure-edition-cards-page").collect do |a|
          e.name = a.search("div.col.sqs-col-12.span-12 h2").text.strip
          e.characters = a.search("div.col.sqs-col-4.span-4 h3").to_a.join(", ")
          e.description = a.search("div.col.sqs-col-4.span-4 p").to_a.join(" ")
        end
      end
    end

    def self.scrape_plunder
      Edition.new.tap do |e|
        Edition.doc.css("#the-plunder-doggs-edition-cards-page").collect do |a|
          e.name = a.search("div.sqs-block-content h2").text.strip
          e.characters = a.search("div.col.sqs-col-6.span-6 h3").to_a.join(", ")
          e.description = a.search("div.col.sqs-col-6.span-6 p").to_a.join(" ")
        end
      end
    end

    def self.scrape_lady_v
      Edition.new.tap do |e|
        Edition.doc.css("#the-lady-victoria-card-page").collect do |a|
          e.name = a.search("h2").text.strip
          e.characters = a.search("h3").text.strip
          e.description = a.search("div#block-yui_3_17_2_1_1534946050355_21337 p").text.strip
        end
      end
    end
end
