Update: friday, 10/12 at 12pm


BIG QUESTIONS:
1. I'm not sure why I can't get the objects to save the properties of the edition if I iterate over a more general piece of
scrape data. But currently I'm getting all of the information I need in all 5 editions.
#DONE# 2. Ideally ideally I would like to have each character displayed on a numbered list and have the description/quote underneath their name.
I need to at least separate out the characters and descriptions with commas or something. How do I manipulate a scraped piece of data?
3. I'm trying to run 5 different slugs at the same time essentially in order to populate my editions variable from the same website, which
is causing a HTTP error 429: too many requests. I need a workaround for this, because I need to use those slugs to get the data I'm working
with....'
4. You are going to want to redo the editions_list so that it reads out the @name variable from each part of the array

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

    def self.scrape_editions
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
  end


      #if I iterate across the above "editions" local variable, maybe, just maybe, I can assign instantiations of the Editions class to those iterations.
      #and then use that to communicate with my controller class. More tomorrow .


  #=> couple problems:
    #1. This method theoretically prints out the editions, but it doesn't save each of them as INSTANCES of an edition
    #2. I'm not able to call this method #scrape_editions on the controller and I'm not sure why
    #2a. That probably won't matter though when I have it saving those as instances because then I will use the editions class
    #2a. so the scraper isn't talking directly to the controller, which feels like a bad idea

  class CharacterScraper
#here is what I am thinking. If I save a hash of my URLs that open different pages, ahh but you should check if each one has
#the same info to srape out the character names and the description (you don't need the title so ditch that).
character_url = [
  "music-the-gathering-cards",
  "the-craic-edition-cards",
  "chaste-treasure-edition-cards",
  "the-plunder-doggs-edition-cards",
  "the-lady-victoria-card"
 ]

    def character_scraper
      character_url = [
        "music-the-gathering-cards",
        "the-craic-edition-cards",
        "chaste-treasure-edition-cards",
        "the-plunder-doggs-edition-cards",
        "the-lady-victoria-card"
       ]
      character_doc = Nokogiri::HTML(open("https://musicthegathering.com/#{character_url[1]}"))
      character_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
        edition_title = element.search("h2").text.strip.gsub("BuY All Three!", "")
        character_names = element.css("div.sqs-block-content").text.split(" ")
        character_description = element.css("p").text.strip
        puts edition_title
        puts character_names
        puts character_description
    end
  end

#take a look at advanced class methods lab -2:50pm 10/11
#okay I am officially simplifying my project. Only one level deep, it's going to be here's a list of the editions, type one of them to get
#info on the editions, then from there it'll go to an "edition description" which will have all of the information for that band, from
#list of characters and their description below that.
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



#some nonsense roundabout way I was trying to get a nice looking description (for posterity)
#character_url = [
#     "music-the-gathering-cards",
#     "the-craic-edition-cards",
#     "chaste-treasure-edition-cards",
#     "the-plunder-doggs-edition-cards",
#     "the-lady-victoria-card"
#    ]
#   character_doc = Nokogiri::HTML(open("https://musicthegathering.com/#{character_url[0]}"))
#   index_number = -1
#   character_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
#     edition_title = element.search("h2").text.strip.gsub("BuY All Three!", "")
#     character_names = element.css("div.sqs-block-content h3").text.strip
#     character_description = element.css("div.sqs-block-content p").text.strip
     #puts edition_title
     #puts character_names
#     puts "#{index_number}. #{character_names}
#     #{character_description}" unless character_names == ""
#     index_number += 1
 #end

 ###
 #sticking my descriptions here for now:

 "
 1. Azia:
 Collect the stealthy captain of team red. Rogue class, with multiple weapon uses,
 medium to high level lyric knowledge, and extremely high levels of crowd-surf ability
 during her solos - a must-have to conquer many challenges.

 2. Liv:
 Collect the woodland keeper of team green. Druid class, dual weapon choice, high level
 lyric knowledge, and high levels of clever witticisms -
 a strong collaborator with future MTG edition players.

 3. Marco: Collect the band brawler of team blue. Fighter class, with multiple
 weapon uses, medium level lyric knowledge, and high levels of tomfoolery -
 a valuable play in the music games to come."

 "
 1. Daniel:
 Collect the piping hot Irishman from the new Craic Edition expansion deck!
 Multiple weapon uses with extremely high lung capacity and elbow strength,
 and strong lyric knowledge. His spell contains a crowd-rouser multiplier.
 A must-have for any Craic fan and a highly valuable asset to your deck.

 2. Tonya:
 Get the powerful and gorgeous viking warrior of Norway! Thunderous drum
 weapons matched with soaring vocals, strong lyric knowledge and harmony power.
 When the light-bearer gift is activated, positivity will instantly strengthen
 your team. An essential element to any collector's deck.

 3. Dylan:
 Pick up the heavy-medieval drummer out of East London!
 With massive strength and power in all types of percussion, strong harmonies,
 and a liver of steel, the Dylan card not only gives your team massive rockstar power,
 but will multiply your team's 'party-factor' by 11.
 A necessity for the collector that loves awesomeness and hates lameness.

 4. Franka:
 Complete your Craic Edition deck with the beautifully
 badass German fiddler and time traveler! Triple weapon power
 (now with SUPER RARE weapon option of Nyckelharpa),  powerful lead lines and solos,
 strong harmonies, and a commanding presence that will send your opponent's team running!
 If you don't have the Franka card, you are doing something wrong with your life. "

 "
 1. Lady Morgan:
 Get the powerful and magnetic Lady Morgan!

 2. Lady Rosaline:
 Get the charming and energetic Lady Rosaline!

 3. Donna Catalina:
 Get the exotic and fiery Donna Catalina!"

 "
 1. Droolin' Jack Porter:
 Droolin' Jack Porter: He's drunk, he's confused, and he's one hell of a guitarist. Get your Jack card today!

 2. Mad Molly Marrowbone:
 Mad Molly Marrowbone: Her vocal power and bodhran skills will make your timbers shiver! Get your Molly card today!"


 "
 1. Lady Victoria:
 The Lady Victoria: Her extensive musical knowledge and one-of-a-kind energy will add power and stamina to your collection!"
