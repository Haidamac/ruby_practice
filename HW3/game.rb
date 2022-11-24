require 'haid'
require 'os'
require_relative 'pet'

class Game 
  #attr_accessor :life_em, :health_em, :mood_em, :satiety_em, :thirst_em, :weariness_em, :irritability_em, :big_acorn_em


  def start_game
    create_pet
    help
    @fin = ''
  end

  def create_pet
    @pet = Pet.new
    p 'Hi! I\'m saber-toothed squirrel from Ice Age! Let\'s go!!!' 
    print 'Choose name for me: '
    @pet.name = gets.chomp.to_s
    generate
  end
    
  # game help info on the screen  
  def help
    p 'Type \'FEED\' to feed Scrat'
    p 'Type \'WATER\' to water Scrat'
    p 'Type \'BED\' to put Scrat asleep'
    p 'Type \'CURE\' to cure Scrat'
    p 'Type \'ACORN\' for give the Big Acorn to Scrat'
    p 'Type \'HTML\' for watch statistic in browser'
    p 'Type \'INFO\' for watch statistic in console'
    p 'Type \'QUIT\' for exit from game'
    p 'no matters: upper- or lowercase'
    your_choice  
  end

  # statistics in console
  def info
    puts 'life:         ' + @pet.life.to_s
    puts 'health:       ' + @pet.health.to_s
    puts 'mood:         ' + @pet.mood.to_s
    puts 'satiety:      ' + @pet.satiety.to_s
    puts 'thirst:       ' + @pet.thirst.to_s
    puts 'weariness:    ' + @pet.weariness.to_s
    puts 'irritability: ' + @pet.irritability.to_s
    puts 'acorn:        ' + @pet.big_acorn.to_s
    your_choice
  end

  def your_choice
    until @fin == 'exit'  
      p 'Type - what you want to do?'
      command = gets.chomp.downcase
      case command
      when 'feed'
        @pet.give_food
        generate
      when 'water'  
        @pet.give_water
        generate
      when 'bed'  
        @pet.put_to_cave
        generate
      when 'cure'
        @pet.give_cure
        generate
      when 'acorn'
        @pet.give_acorn
        generate
      when 'html'
        generate 
        if OS.windows?
          system("start index.html")  
        else
        system("xdg-open index.html")
        end
      when 'info'
        info
      when 'help'
        help
      when 'quit'
        p 'Good bye!!!'
        exit
      else
        p 'Wrong command! Type \"help\" for more information'
      end   
    end
  end 
  
  # def set_emojies
  #   @life_em = life_emojies
  #   @health_em = health_emojies
  #   @mood_em = mood_emojies
  #   @satiety_em = satiety_emojies
  #   @thirst_em = thirst_emojies
  #   @weariness_em = weariness_emojies
  #   @irritability_em = irritability_emojies
  #   @big_acorn_em = big_acorn_emojies
  # end


  def life_emojies
    combinated_emojies = "&#128512;" * @pet.life + "&#128128;" * (9 - @pet.life)
  end

  def health_emojies
    combinated_emojies = "&#128522;" * @pet.health + "&#129397;" * (9 - @pet.health)
    return combinated_emojies  if @pet.health.between?(0, 9)
    emoji = @pet.health.negative? ? "&#129397;" : "&#128522;"
    emoji  * 9
  end

  def mood_emojies  
    combinated_emojies = "&#128540;" * @pet.mood + "&#129402;" * (9 - @pet.mood)
    return combinated_emojies  if @pet.mood.between?(0, 9)
    emoji = @pet.mood.negative? ? "&#129402;" : "&#128540;"
    emoji  * 9
  end 

  def satiety_emojies
    combinated_emojies = "&#128523;" * @pet.satiety + "&#129324;" * (9 - @pet.satiety)
    return combinated_emojies  if @pet.satiety.between?(0, 9)
    emoji = @pet.satiety.negative? ? "&#129324;" : "&#128523;"
    emoji  * 9
  end

  def thirst_emojies
    combinated_emojies = "&#128167;" * @pet.thirst + "&#128293;" * (9 - @pet.thirst)
    return combinated_emojies  if @pet.thirst.between?(0, 9)
    emoji = @pet.satiety.negative? ? "&#128293;" : "&#128167;"
    emoji  * 9
  end

  def weariness_emojies
    combinated_emojies = "&#128553;" * @pet.weariness + "&#128521;" * (9 - @pet.weariness)
    return combinated_emojies  if @pet.weariness.between?(0, 9)
    emoji = @pet.weariness.negative? ? "&#128521;" : "&#128553;"
    emoji  * 9
  end

  def irritability_emojies
    combinated_emojies = "&#128127;" * @pet.irritability + "&#129321;" * (9 - @pet.irritability)
    return combinated_emojies  if @pet.irritability.between?(0, 9)
    emoji = @pet.irritability.negative? ? "&#129321;" : "&#128127;"
    emoji  * 9
  end
  
  def big_acorn_emojies
    emoji = @pet.big_acorn.negative? ? "&#128683;" : "&#127792;"
  end


  def html
    # make html
    <<-HTML
      <div align="center"><img src="img/ice_age_t.png"></div>  
      <table align="center">
        <tr>
          <th rowspan="8"><h1>Hi, I'm Scrat!</h1></br>
            <img src="img/scrat.png">
          </th>
          <td><h2>Life</h2></td><td><h2> #{life_emojies} </h2></td><td><button name="cure"><h3>Quit</h3></button></td>
        </tr>
        <tr>
          <td><h2>Health</h2></td><td><h2> #{health_emojies} </h2></td><td><button name="cure"><h3>Give a Cure!</h3></button></td>
        </tr>
        <tr>
          <td><h2>Mood</h2></td><td><h2> #{mood_emojies} </h2></td><td></td>
        </tr>
        <tr>
          <td><h2>Satiety</h2></td><td><h2> #{satiety_emojies} </h2></td><td><button name="feed"><h3>Give a Food!</h3></button></td>
        </tr>
        <tr>
          <td><h2>Thirst</h2></td><td><h2> #{thirst_emojies} </h2></td><td><button name="water"><h3>Give a Water!</h3></button></td>
        </tr>
        <tr>
          <td><h2>Weariness</h2></td><td><h2> #{weariness_emojies} </h2></td><td><button name="bed"><h3>Put to Cave!</h3></button></td>
        </tr>
        <tr>
          <td><h2>Irritability</h2></td><td><h2> #{irritability_emojies} </h2></td><td></td>
        </tr>
        <tr>
          <td><h2>Acorn</h2></td><td><h2> #{big_acorn_emojies} </h2></td><td><button name="acorn"><h3>Give an Acorn!</h3></button></td>
        </tr>
      </table>
    HTML
  end

  def generate
    Haid.html_gen(html, bypass_html: true) 
  end  

end

Game.new.start_game