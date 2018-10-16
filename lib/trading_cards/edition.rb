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
          e.characters = a.search("div.col.sqs-col-4.span-4 h3").to_a.join(", ")
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


    #I guess my biggest problem in figuring out what I'm changing it to now versus what I had before is that I
    #still dont' get how to save JUST 5 edition objects with all of the info lined up properly other than looking through the arrays
    #and pulling out the indexes. My scraping selectors can't get so specific that I have just the 5 names, 5 character lists, and
    #5 character stats without having specificity differences.

  #so I want 5 objects to go in, but I only want to use my open-uri so operate once
  #running into a zipper problem potentially
  #edition.characters = mtg_doc.search("div.sqs-block.html-block.sqs-block-html h3").to_a.join(", ").strip
  #edition.description = mtg_doc.search("div.col.sqs-col-4.span-4 p").to_a.join(" ").strip
end
