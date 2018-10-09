
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
    scrape_details
    scrape_characters
    @edition
  end

  def scrape_details
    @edition.name = @doc.search("whatever.I'm.scraping")
    #want it to scrape for information about the edition, which should only be name and URL...
  end

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


    #add the character to the edition
  end


end
