
  #=> I might need an EditionScraper class
  #=> Maybe I need that class needs to instantiate the edition based on the number from the list?
  #=> I need to scrape the details of that edition
  #=> I need srape the individual characters for that edition and add them to the instance of that edition

class EditionScraper
attr_accessor :edition, :doc

    def initialize
      @edition = Edition.new
      @doc = Nokogiri::HTML(open("https://musicthegathering.com"))
    end

    def scrape
      scrape_editions
      @edition
    end

    def scrape_editions
      @doc = Nokogiri::HTML(open("https://musicthegathering.com"))
      mtg = @doc.search("div#block-yui_3_17_2_1_1534896694126_49243.sqs-block.html-block.sqs-block-html").text.strip
      craic = @doc.search("div#block-yui_3_17_2_1_1534896694126_56732.sqs-block.html-block.sqs-block-html").text.strip
      chaste = @doc.search("div#block-yui_3_17_2_1_1534896694126_62410.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")
      plunder = @doc.search("div#block-yui_3_17_2_1_1534943478376_19237.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")
      lady_v = @doc.search("div#block-yui_3_17_2_1_1534943478376_60459.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")
      editions = [mtg, craic, chaste, plunder, lady_v]
      editions.each_with_index do |edition, i|
        puts "#{i + 1}. #{edition}"
      end
    end
  end
    @doc = Nokogiri::HTML(open("https://musicthegathering.com"))
    editions = @doc.search("div.sqs-block.html-block.sqs-block-html").collect do |title_element|
      title_element.css("div.sqs-block-content h1")
    end

      #if I iterate across the above "editions" local variable, maybe, just maybe, I can assign instantiations of the Editions class to those iterations.
      #and then use that to communicate with my controller class. More tomorrow .


  #=> couple problems:
    #1. This method theoretically prints out the editions, but it doesn't save each of them as INSTANCES of an edition
    #2. I'm not able to call this method #scrape_editions on the controller and I'm not sure why
    #2a. That probably won't matter though when I have it saving those as instances because then I will use the editions class
    #2a. so the scraper isn't talking directly to the controller, which feels like a bad idea

  class CharacterScraper

    def mtg_scraper
      mtg_doc = Nokogiri::HTML(open("https://musicthegathering.com/music-the-gathering-cards"))
      mtg_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
      mtg_title = element.search("h2").text.strip.gsub("BuY All Three!", "")
      mtg_names = element.css("div.sqs-block-content").text.split(" ")
      puts mtg_title
      puts mtg_names.is_a?(Array)
    end
  end



    # def toplevel_scraper
      # doc = Nokogiri...
      # list_doc = doc.css("card-selector")
      # iterate over list_doc (e.g. list_doc.each do |element|)

    # end


    def scrape_characters
      @doc.search("whatever.I'm.scraping").each do |character|
      #instantiate the character
      a = Character.new
      #scrape the data
      a.name = character.search("scraping for the name").text.strip
      a.edition = character.search("scraping for the edition?").text.strip
      a.description = character.search("scraping for the description.").text.strip
      a.url = character.serach("scraping for the URL").attr("href").strip
      @edition.add_character(a)
      end
      #add the character to the edition
    end
end


#since I've got gemspec problems and console problems, I figure out some scraping in repl.it. Here's that work:

#d = Nokogiri::HTML(open("https://musicthegathering.com"))

#mtg = d.search("div#block-yui_3_17_2_1_1534896694126_49243.sqs-block.html-block.sqs-block-html").text.strip

#craic = d.search("div#block-yui_3_17_2_1_1534896694126_56732.sqs-block.html-block.sqs-block-html").text.strip

#chaste = d.search("div#block-yui_3_17_2_1_1534896694126_62410.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")

#plunder = d.search("div#block-yui_3_17_2_1_1534943478376_19237.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")

#lady_v = d.search("div#block-yui_3_17_2_1_1534943478376_60459.sqs-block.html-block.sqs-block-html").text.strip.gsub("NEW! ", "")

#editions = [mtg, craic, chaste, plunder, lady_v]

#editions.each_with_index do |edition, i|
#puts "#{i+1}. #{edition}"
#end

#need to figure out how to pull the URLs
#https://www.musicthegathering.com/music-the-gathering-cards/
#https://www.musicthegathering.com/the-craic-edition-cards/
#https://www.musicthegathering.com/chaste-treasure-edition-cards/
#https://www.musicthegathering.com/the-plunder-doggs-edition-cards
#https://www.musicthegathering.com/the-lady-victoria-card



#mtg_doc = Nokogiri::HTML(open("https://musicthegathering.com/music-the-gathering-cards"))

#MTG characters
#azia = mtg_doc.search("div#block-yui_3_17_2_1_1534892891091_37329.sqs-block.html-block.sqs-block-html").each do |character_div|
#azia_name = character_div.search("h3").text.strip
#azia_description = character_div.search("p").text.strip
#puts azia_name
#puts ""
#puts azia_description
#puts ""
#end



#liv = mtg_doc.search("div#block-yui_3_17_2_1_1534892891091_38648.sqs-block.html-block.sqs-block-html").each do |character_div|
#liv_name = character_div.search("h3").text
#liv_description = character_div.search("p").text
#puts liv_name
#puts ""
#puts liv_description
#puts ""
#end


#marco = mtg_doc.search("div#block-yui_3_17_2_1_1534892891091_40394.sqs-block.html-block.sqs-block-html").each do |character_div|
#marco_name = character_div.search("h3").text
#marco_description = character_div.search("p").text
#puts marco_name
#puts ""
#puts marco_description
#puts ""
#end

#mtg_doc = Nokogiri::HTML(open("https://musicthegathering.com/music-the-gathering-cards"))

#MTG descriptions
#mtg_each = mtg_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
#mtg_title = element.search("h2").text.strip.gsub("BuY All Three!", "")
#mtg_names = element.search("h3").text.strip

#puts mtg_title
#puts mtg_names

#end

#Questions for first 1:1:

#---- once we figure that out---
#3. Understanding my objects better and how they will communicate with my scraper class
#4. How to continue refactoring the scraping so that I'm not loading the website over and over again.
#5. Fix that "exit" bug in my controller (understand what's wrong with my control flow logic)
