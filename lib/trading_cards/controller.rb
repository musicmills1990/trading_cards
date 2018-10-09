class Controller

def call
  binding.pry
  list_editions
  editions_menu
  music_the_gathering_menu || craic_show_menu || chaste_treasure_menu || plunder_doggs_menu || lady_victoria_menu
  goodbye
end

def list_editions
  puts "Hello and welcome to the card shop!"
  puts "1. Music The Gathering
  2. The Craic Show
  3. Chaste Treasure
  4. The Plunder Doggs
  5. The Lady Victoria"
end

def editions_menu
  input = nil
  puts "Please type the number of the edition you would like to see, or type 'list' to see the editions again."
  input = gets.strip.downcase
  case input
  when "1"
    puts "Music The Gathering:
    1. Azia
    2. Liv
    3. Marco"
    music_the_gathering_menu
  when "2"
    puts "The Craic Show:
    1. Daniel
    2. Tonya
    3. Dylan
    4. Franka"
    craic_show_menu
  when "3"
    puts "Chaste Treasure:
    1. Lady Morgan
    2. Lady Rosaline
    3. Donna Catalina"
    chaste_treasure_menu
  when "4"
    puts "The Plunder Doggs:
    1. Droolin' Jack Porter
    2. Mad Molly Marrowbone"
    plunder_doggs_menu
  when "5"
    puts "The Lady Victoria:
    1. Lady Victoria"
    lady_victoria_menu
  when "list"
    list_editions
  else
    puts "pick 1-5 or 'list' please."
  end
end

def music_the_gathering_menu
  input = nil
    while input != 'exit'
      puts "Please enter the number of the character you'd like to know more about, 'list' to see the editions again, or 'exit':"
    input = gets.strip.downcase
      case input
      when "1"
        puts "Azia: Collect the stealthy captain of team red. Rogue class, with multiple weapon uses, medium to high level lyric knowledge, and extremely high levels of crowd-surf ability during her solos - a must-have to conquer many challenges."
      when "2"
        puts "Liv: Collect the woodland keeper of team green. Druid class, dual weapon choice, high level lyric knowledge, and high levels of clever witticisms - a strong collaborator with future MTG edition players."
      when "3"
        puts "Marco: Collect the band brawler of team blue. Fighter class, with multiple weapon uses, medium level lyric knowledge, and high levels of tomfoolery - a valuable play in the music games to come."
      when "list"
        list_editions
        editions_menu
      else
       puts "Don't break the rules! number of the character, list, or exit, please."
     end
   end
 end

 def craic_show_menu
   input = nil
   while input != 'exit'
       puts "Please enter the number of the character you'd like to know more about, 'list' to see the editions again, or 'exit':"
     input = gets.strip.downcase
     case input
     when "1"
       puts "Daniel: Collect the piping hot Irishman from the new Craic Edition expansion deck! Multiple weapon uses with extremely high lung capacity and elbow strength, and strong lyric knowledge. His spell contains a crowd-rouser multiplier. A must-have for any Craic fan and a highly valuable asset to your deck. "
     when "2"
       puts "Tonya: Get the powerful and gorgeous viking warrior of Norway! Thunderous drum weapons matched with soaring vocals, strong lyric knowledge and harmony power. When the light-bearer gift is activated, positivity will instantly strengthen your team. An essential element to any collector's deck."
     when "3"
       puts "Dylan: Pick up the heavy-medieval drummer out of East London! With massive strength and power in all types of percussion, strong harmonies, and a liver of steel, the Dylan card not only gives your team massive rockstar power, but will multiply your team's 'party-factor' by 11. A necessity for the collector that loves awesomeness and hates lameness."
     when "4"
       puts "Franka: Complete your Craic Edition deck with the beautifully badass German fiddler and time traveler! Triple weapon power (now with SUPER RARE weapon option of Nyckelharpa),  powerful lead lines and solos, strong harmonies, and a commanding presence that will send your opponent's team running! If you don't have the Franka card, you are doing something wrong with your life. "
     when "list"
       list_editions
       editions_menu
     else
      puts "Don't break the rules! number of the character, list, or exit, please."
    end
  end
end


  def chaste_treasure_menu
    input = nil
    while input != 'exit'
        puts "Please enter the number of the character you'd like to know more about, 'list' to see the editions again, or 'exit':"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Lady Morgan: Get the powerful and magnetic Lady Morgan!"
      when "2"
        puts "Lady Rosaline: Get the charming and energetic Lady Rosaline!"
      when "3"
        puts "Donna Catalina: Get the exotic and fiery Donna Catalina!"
      when "list"
        list_editions
        editions_menu
      else
       puts "Don't break the rules! Number of the character, list, or exit, please."
     end
   end
 end


   def plunder_doggs_menu
     input = nil
     while input != 'exit'
         puts "Please enter the number of the character you'd like to know more about, 'list' to see the editions again, or 'exit':"
       input = gets.strip.downcase
       case input
       when "1"
         puts "Droolin' Jack Porter: He's drunk, he's confused, and he's one hell of a guitarist. Get your Jack card today!"
       when "2"
         puts "Mad Molly Marrowbone: Her vocal power and bodhran skills will make your timbers shiver! Get your Molly card today!"
       when "list"
         list_editions
         editions_menu
       else
        puts "Don't break the rules! number of the character, list, or exit, please."
      end
    end
  end



    def lady_victoria_menu
      input = nil
      while input != 'exit'
          puts "Please enter the number of the character you'd like to know more about, 'list' to see the editions again, or 'exit':"
        input = gets.strip.downcase
        case input
        when "1"
          puts "The Lady Victoria: Her extensive musical knowledge and one-of-a-kind energy will add power and stamina to your collection!"
        when "list"
          list_editions
          editions_menu
        else
         puts "Don't break the rules! number of the character, list, or exit, please."
       end
     end
   end

def goodbye
puts "For more information, pictures, and contact information, go to www.musicthegathering.com. See you soon!"
end

end
