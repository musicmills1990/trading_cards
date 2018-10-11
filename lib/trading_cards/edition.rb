class Edition
#what does an edition have?
#=> an edition has many characters (a list of characters)
  attr_accessor :name, :characters, :description


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

  def self.edition_menu
    editions = []
     editions << self.scrape_mtg
     editions << self.scrape_craic
#    editions << self.scrape_chaste
#    editions << self.scrape_plunder
#    editions << self.scrape_lady_v
    editions
    end


    def self.scrape_mtg
      mtg_doc = Nokogiri::HTML(open("https://musicthegathering.com/music-the-gathering-cards"))

      edition = self.new

        edition.name = mtg_doc.search("div.sqs-block.html-block.sqs-block-html h2").text.gsub("BuY All Three!", "").strip
        edition.characters = mtg_doc.search("div.sqs-block.html-block.sqs-block-html h3").text.strip
        edition.description = mtg_doc.search("div.sqs-block.html-block.sqs-block-html p").text.strip

      edition
    end


    def self.scrape_craic
      craic_doc = Nokogiri::HTML(open("https://musicthegathering.com/the-craic-edition-cards"))

      edition = self.new
        edition.name = craic_doc.search("div.sqs-block.html-block.sqs-block-html h2").text.strip.gsub("Buy All Four!", "")
        edition.characters = craic_doc.search("div.sqs-block.html-block.sqs-block-html h3").text.strip
        edition.description = craic_doc.search("div.sqs-block.html-block.sqs-block-html.sqs-block-content p").text.strip

      edition
    end

    def self.scrape_chaste
      chaste_doc = Nokogiri::HTML(open("https://musicthegathering.com/chaste-treasure-edition-cards"))

      edition = self.new
        chaste_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
          edition.name = element.search("h2").text.strip.gsub("BuY All Three!", "")
          edition.characters = element.search("h3").text.strip
          edition.description = element.css("div.sqs-block-content p").text
        end
      edition
    end

    def self.scrape_plunder
      plunder_doc = Nokogiri::HTML(open("https://musicthegathering.com/the-plunder-doggs-edition-cards"))

      edition = self.new
        plunder_doc.search("div.sqs-block.html-block.sqs-block-html").each do |element|
          edition.name = element.search("h2").text.strip.gsub("BuY All Three!", "")
          edition.characters = element.search("h3").text.strip
          edition.description = element.css("div.sqs-block-content p").text
        end
      edition
    end

    def self.scrape_lady_v
      lady_v = Nokogiri::HTML(open("https://musicthegathering.com/the-lady-victoria-card"))

      edition = self.new
        lady_v.search("div.sqs-block.html-block.sqs-block-html").each do |element|
          edition.name = element.search("h2").text.strip.gsub("BuY All Three!", "")
          edition.characters = element.search("h3").text.strip
          edition.description = element.css("div.sqs-block-content p").text
        end
      edition
    end

end


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
