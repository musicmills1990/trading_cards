class Edition
#what does an edition have?
#=> an edition has many characters (a list of characters)
  attr_accessor :name, :characters, :description
  @@editions = []

  def self.editions
  @@editions
  end


  def self.scrape_editions_list
    @doc = Nokogiri::HTML(open("https://musicthegathering.com"))
    edition_ids = {
      mtg: "1534896694126_49243",
      craic: "1534896694126_56732",
      chaste: "1534896694126_62410",
      plunder: "1534943478376_19237",
      lady_v: "1534943478376_60459"
    }
    index_number = 1
    edition_ids.collect do |key, value|
      edition = @doc.search("div#block-yui_3_17_2_1_#{value}.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")
      puts "#{index_number}. #{edition}"
        index_number += 1
    end
  end

  def self.scrape_details
    @@editions
     @@editions << self.scrape_mtg
     @@editions << self.scrape_craic
     @@editions << self.scrape_chaste
     @@editions << self.scrape_plunder
     @@editions << self.scrape_lady_v
    @@editions
    end


    def self.scrape_mtg
      mtg_doc = Nokogiri::HTML(open("https://musicthegathering.com/music-the-gathering-cards"))

        edition = self.new
        edition.name = mtg_doc.search("div.sqs-block.html-block.sqs-block-html h2").text.gsub("BuY All Three!", "").strip
        edition.characters = mtg_doc.search("div.sqs-block.html-block.sqs-block-html h3").to_a.join(", ").strip
        edition.description = mtg_doc.search("div.col.sqs-col-4.span-4 p").to_a.join(" ").strip 

      edition
    end


    def self.scrape_craic
      craic_doc = Nokogiri::HTML(open("https://musicthegathering.com/the-craic-edition-cards"))

      edition = self.new
        edition.name = craic_doc.search("div.sqs-block.html-block.sqs-block-html h2").text.strip.gsub("Buy All Four!", "")
        edition.characters = craic_doc.search("div.sqs-block.html-block.sqs-block-html h3").to_a.join(", ")
        edition.description = craic_doc.search("div.col.sqs-col-6.span-6 p").to_a.join(" ")

      edition
    end

    def self.scrape_chaste
      chaste_doc = Nokogiri::HTML(open("https://musicthegathering.com/chaste-treasure-edition-cards"))

      edition = self.new
        edition.name = chaste_doc.search("div.col.sqs-col-12.span-12 h2").text.strip
        edition.characters = chaste_doc.search("div.col.sqs-col-4.span-4 h1").to_a.join(", ")
        edition.description = chaste_doc.search("div.col.sqs-col-4.span-4 p").to_a.join(" ")

      edition
    end

    def self.scrape_plunder
      plunder_doc = Nokogiri::HTML(open("https://musicthegathering.com/the-plunder-doggs-edition-cards"))

      edition = self.new
        edition.name = plunder_doc.search("div.sqs-block-content h2").text.strip
        edition.characters = plunder_doc.search("div.col.sqs-col-6.span-6 h1").to_a.join(", ")
        edition.description = plunder_doc.search("div.col.sqs-col-6.span-6 p").to_a.join(" ")

      edition
    end

    def self.scrape_lady_v
      lady_doc = Nokogiri::HTML(open("https://musicthegathering.com/the-lady-victoria-card"))

      edition = self.new
        edition.name = lady_doc.search("div.sqs-block-content h1").first.text.strip.gsub("It's time to ", "")
        edition.characters = lady_doc.search("div#block-yui_3_17_2_1_1534946050355_21337 h1").text.strip
        edition.description = lady_doc.search("div#block-yui_3_17_2_1_1534946050355_21337 p").text.strip

      edition
    end

end
