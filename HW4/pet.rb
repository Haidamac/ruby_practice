class Pet
  attr_reader :name, :life, :health, :mood, :satiety, :thirst, :weariness, :asleep, :irritability, :big_acorn, :last_feed_time, :last_drink_time, :last_rest_time   

 	def initialize(name)
    @name = name
    @life = 9
    @health = 9
    @mood = 9
    @satiety = 9
    @thirst = 9
    @weariness = 0
    @asleep = false
    @irritability = 3
    @big_acorn = 0
    @last_feed_time = Time.now
    @last_drink_time = Time.now
    @last_rest_time = Time.now
    @mess = ''
  end

	def give_food
    if @satiety >= 8
      @mess = "I don't want your stupid small nuts, I want the Big Acorn!"
      @irritability += 1       
      passage_of_time if @irritability >9
    else
      @mess = "Mnom... mnom... I like nuts, but acorns are better"
      @satiety += 2
      @last_feed_time = Time.now()  
    end
  end

  def give_water
    if @thirst >= 9
      @mess = "I don't want to drink water! I want the Big Acorn or some gin or whiskey at least :)"
      @irritability += 1
      passage_of_time if @irritability >9
    else
      @mess = "Splish... splash... In vino veritas, in aqua sanitas"
      @thirst += 1
      @last_drink_time = Time.now()  
    end
  end

  def put_cave
    if @big_acorn == 1 && @weariness > 6
      @asleep = true
      @irritability = 0
      @weariness   -= 5
      3.times do
        if @asleep
          passage_of_time
        end
        if @asleep
          @mess = "#{@name} drops an acorn from his hands"
          @last_rest_time  = Time.now()
        end
      end
      if @asleep
        @asleep = false
        @mood -= 1
        @irritability += 1
        if @irritability >9 || @mood < 1
          passage_of_time 
          @mess = "#{@name} jumps out of the cave in search of an acorn"
        end
      end
    else
      if @big_acorn < 1
        @mess = "I won't fall asleep without an acorn!"
      end
      @asleep = false
      @mood -= 1
      passage_of_time if @mood < 1
    end
  end

  def give_cure
    if @health >= 9 
    	@mess = "I'm perfectly healthy and wants the Big Acorn not medicine!"
      @irritability += 1
      passage_of_time if @irritability >9
    else
      @mess = "Oh... ah... I'm afraid of injections"
      @health += 1  
    end
  end

  def give_acorn
    @big_acorn += 1
    @irritability = 0
    @mood = 9
    @mess = "Yoo-hoo!!! But I need hide this acorn immediately"
    incident
  end 

  def message
    message = @mess
  end 

  # make emoji for html 
  def life_em
    combinated_emojies = "&#128512;" * @life + "&#128128;" * (9 - @life)
  end

  def health_em
    combinated_emojies = "&#128522;" * @health + "&#129397;" * (9 - @health)
    return combinated_emojies  if @health.between?(0, 9)
    emoji = @health.negative? ? "&#129397;" : "&#128522;"
    emoji * 9
  end
  
  def mood_em  
    combinated_emojies = "&#128540;" * @mood + "&#129402;" * (9 - @mood)
    return combinated_emojies  if @mood.between?(0, 9)
    emoji = @mood.negative? ? "&#129402;" : "&#128540;"
    emoji * 9
  end 

  def satiety_em
    combinated_emojies = "&#128523;" * @satiety + "&#129324;" * (9 - @satiety)
    return combinated_emojies  if @satiety.between?(0, 9)
    emoji = @satiety.negative? ? "&#129324;" : "&#128523;"
    emoji * 9
  end

  def thirst_em
    combinated_emojies = "&#128167;" * @thirst + "&#128293;" * (9 - @thirst)
    return combinated_emojies  if @thirst.between?(0, 9)
    emoji = @satiety.negative? ? "&#128293;" : "&#128167;"
    emoji * 9
  end

  def weariness_em
    combinated_emojies = "&#128553;" * @weariness + "&#128521;" * (9 - @weariness)
    return combinated_emojies  if @weariness.between?(0, 9)
    emoji = @weariness.negative? ? "&#128521;" : "&#128553;"
    emoji * 9
  end

  def irritability_em
    combinated_emojies = "&#128127;" * @irritability + "&#129321;" * (9 - @irritability)
    return combinated_emojies  if @irritability.between?(0, 9)
    emoji = @irritability.negative? ? "&#129321;" : "&#128127;"
    emoji * 9
  end
  
  def big_acorn_em 
    emoji = @big_acorn.zero? ? "&#128064;" : "&#127792;"
  end


  private
      
    def moody?   # if Scrat is sad
      @mood < 1
    end

    def hungry?  # if Scrat is hungry
      @satiety <= 2
    end
      
    def thirsted?  # if Scrat feels thirsty
      @thirst <= 1
    end

    def angry?  # if Scrat is angry
      @irritability > 9
    end

    def sick?  # if Scrat is sick
      @health <= 1
    end

    def two_acorn?  # if Scrat has 2 acorns at once
      @big_acorn > 1
    end  

    def incident  # Scrat has an adventure when he tries to hide an acorn
      @big_acorn > 0 && @asleep = false && @weariness < 7
      inc = rand(10)
      case inc
      when 1
        @mess = "#{@name} got caught in an avalanche"
        outcome
      when 3
        @mess = "#{@name} fell through the ice"
        outcome
      when 5
        @mess = "#{@name} fell off the cliff"
        outcome
      when 7
        @mess = "#{@name} was struck by lightning"
        outcome
      when 9
        @mess = "#{@name} engaged in a battle with piranhas"
        outcome
      when 11
        @mess = "#{@name} ended up in space"
        revival
      else
        @mess = "#{@name} tries to hide the acorn, but he can't"
        @irritability += 1
        @mood -= 1
        @weariness += 1
        passage_of_time 
      end
    end

    def outcome
      @health -= (rand(5)+1)
      @big_acorn = 0
      @mood -= (rand(3)+1)
      @irritability += (rand(3)+1)
      passage_of_time
    end

    def revival
      @big_acorn = 0
      @life -= 1
      @mood = 9           
      @satiety = 9          
      @thirst = 9           
      @weariness = 0           
      @irritability = 3           
      @health = 9          
      passage_of_time
    end

    def passage_of_time # some time passes
      if @life < 1
        @mess = "#{@name} has died :((("
        @fin = 'exit'
        exit  #  exit the game  
      end
  
      if @satiety > 0
        if Time.now() - @last_feed_time > 30
          @satiety -= 3 
        end  
      else  #  Scrat is starving!
        if @asleep
          @asleep = false
          @mess = "#{@name} Suddenly wakes up!"
        end
        @mess = "Hungry #{@name} has eaten you!"
        @fin = 'exit'
        exit  #  exit the game
      end
        
      if @thirst > 0
        if Time.now() - @last_drink_time > 15
          @thirst -= 1
        end
      else # Scrat is suffering from thirst
        @mess = "#{@name} has lost 1 life due to thirst!"
        revival 
      end

      if @weariness < 9
        if Time.now() - @last_rest_time > 60
          @weariness += 1
        end
      else # Scrat is exhausted
        @mess = "#{@name} has lost 1 life due to exhaustion"
        revival   
      end
        
      if moody? 
        @mess = "#{@name} has lost 1 life due to sorrow!"
        revival
      end

      if hungry?
        if @asleep
          @asleep = false
          @mess = "#{@name} wakes up suddenly!"
        end
        @mess = "#{@name} is hungry!"
      end

      if thirsted?
        if @asleep
          @asleep = false
          @mess = "#{@name} wakes up suddenly!"
        end
        @mess = "#{@name} wants to drink!"
      end

      if angry?
        @mess = "An irritated #{@name} has killed you in a state of affect!"
        @fin = 'exit'
        exit  #  exit the game
      end

      if sick?
        @mess = "#{@name} has lost 1 life due to disease"
        revival
      end
        
      if two_acorn?
        @mess = "#{@name} tries to carry 2 acorns at the same time, loses both"
        @big_acorn = 0
        @mood -= 1
        @irritability += 1
      end
    end

end

