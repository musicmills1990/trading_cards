class Controller

def call
  list_editions
  editions_menu
  goodbye
end

def list_editions
  puts "Hello and welcome to the card shop!"
  Edition.scrape_editions_list
end

def editions_menu
  input = nil
  while input != 'exit'
    puts "Please type the number of the edition you would like to see, or type 'list' to see the editions again."
    input = gets.strip.downcase
    if input.to_i > 0
      @editions = Edition.edition_menu
      the_edition = @editions[input.to_i-1]

        puts "#{the_edition.name}"
        puts "#{the_edition.characters}"
        puts "#{the_edition.description}"

    elsif input == "list"
      list_editions
    elsif input == "exit"
      break
    else
      puts "Sorry, I'm not sure what you mean. Please type 1-5, 'list' or 'exit'."
    end
  end
end

def goodbye
  puts "For more information, pictures, and contact information, go to www.musicthegathering.com. See you soon!"
end

end
