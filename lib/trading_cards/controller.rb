class Controller

def call
  Scraper.scrape_details
  list_editions
  editions_menu
  goodbye
end

def list_editions
  puts "Hello and welcome to the card shop!"
  editions_list = Edition.all
  editions_list.each_with_index do |names, i|
    puts "#{i + 1}. #{names.name}"
  end
end

def editions_menu
  input = nil
  while input != 'exit'
    puts "Please type the number of the edition you would like to see, or type 'list' to see the editions again."
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= Edition.all.size
      #editions = Edition.editions
      #the_edition = editions[input.to_i-1]

        puts "#{Edition.all[input.to_i-1].name}"
        puts "Characters: #{Edition.all[input.to_i-1].characters}"
        puts <<~HEREDOC
        Stats & Quotes: #{Edition.all[input.to_i-1].description}
         HEREDOC

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
