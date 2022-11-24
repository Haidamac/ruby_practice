require 'haid'
require 'os'


class Pet 
  attr_accessor :name, :life, :health, :mood, :satiety, :thirst, :weariness, :asleep, :irritability, :big_acorn, :last_feed_time, :last_drink_time, :last_rest_time

  def initialize (name = "Scrat", life = 9, mood = 9, satiety = 9, thirst = 9, weariness = 0, asleep = false, irritability = 3, health = 9, big_acorn = 0)
    @name            = name
    @life            = life   
    @mood            = mood   
    @satiety         = satiety
    @thirst          = thirst
    @weariness       = weariness
    @asleep          = asleep
    @irritability    = irritability
    @health          = health
    @big_acorn       = big_acorn
    @last_feed_time  = Time.now()  #  He has just been fed
    @last_drink_time = Time.now()  #  He just drank some water
    @last_rest_time  = Time.now()  #  He just rested
  end

def give_food
    p "You feed #{@name}"
    if @satiety >= 8
      p "#{@name} doesn't want your stupid small nuts, he wants the Big Acorn!"
      @irritability += 1       
      passage_of_time if @irritability >9
    else
      @satiety += 3
      @last_feed_time = Time.now()  
    end
  end
      
  def give_water
    p "You give #{@name} some water"
    if @thirst >= 7
      p "#{@name} doesn't want to drink water! He wants the Big Acorn or some gin or whiskey at least :)"
      @irritability += 1
      passage_of_time if @irritability >9
    else
      @thirst += 1
      @last_drink_time = Time.now()  
    end
  end
      
  def put_to_cave
    p "You put #{@name} to sleep in the cave"
    if @big_acorn == 1 && @weariness > 5
      @asleep       = true
      @irritability = 0
      @weariness   -= 1
      3.times do
        if @asleep
          passage_of_time
        end
        if @asleep
          p "#{@name} drops an acorn from his hands"
          @last_rest_time  = Time.now()
        end
      end
      if @asleep
        @asleep       = false
        @mood         -= 1
        @irritability += 1
        passage_of_time if @irritability >9 || @mood < 1
        p "#{@name} jumps out of the cave in search of an acorn"
      end
    else
      if @big_acorn < 1
        p "#{@name} won't fall asleep without an acorn"
      else
        p "#{@name} doesn't want to sleep"
      end
      @asleep = false
      @mood  -= 1
      passage_of_time if @mood < 1
    end
  end
      
  def give_cure
    p "You heal #{@name}"
    if @health >= 9 
      p "#{@name} is perfectly healthy and wants the Big Acorn not medicine!"
      @irritability += 1
      passage_of_time if @irritability >9
    else
      @health += 1  
    end
  end
      
  def give_acorn
    p "You give #{@name} the Big Acorn"
    @big_acorn    += 1
    @irritability = 0
    @mood         = 9
    p "Joyful #{@name} runs to hide the acorn"
    incident
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
    inc = rand(14)
    case inc
    when 0, 2, 4, 8, 10, 12, 13
      p "#{@name} tries to hide the acorn, but he can't"
      @irritability += 1
      @mood         -= 1
      @weariness    += 1
      passage_of_time 
    when 1
      p "#{@name} got caught in an avalanche"
      outcome
    when 3
      p "#{@name} fell through the ice"
      outcome
    when 5
      p "#{@name} fell off the cliff"
      outcome
    when 7
      p "#{@name} was struck by lightning"
      outcome
    when 9
      p "#{@name} Scrat engaged in a battle with piranhas"
      outcome
    when 11
      p "#{@name} ended up in space"
      revival
    end
  end

  def outcome
    @health       -= (rand(5)+1)
    @big_acorn     = 0
    @mood         -= (rand(3)+1)
    @irritability += (rand(3)+1)
    passage_of_time
  end

  def revival
    @big_acorn    = 0
    @life        -= 1
    @mood         = 9           
    @satiety      = 9          
    @thirst       = 9           
    @weariness    = 0           
    @irritability = 3           
    @health       = 9          
    passage_of_time
  end

  def passage_of_time # some time passes
    if @life < 1
      p "#{@name} has died :((("
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
        p "#{@name} Suddenly wakes up!"
      end
      p "Hungry #{@name} has eaten you!"
      @fin = 'exit'
      exit  #  exit the game
    end
        
    if @thirst > 0
      if Time.now() - @last_drink_time > 15
         @thirst -= 1
      end
    else # Scrat is suffering from thirst
      p "#{@name} has lost 1 life due to thirst!"
      revival
    end

    if @weariness < 9
      if Time.now() - @last_rest_time > 60
         @weariness += 1
      end
    else # Scrat is exhausted
      p "#{@name} has lost 1 life due to exhaustion"
      revival   
    end
        
    if moody? 
      p "#{@name} has lost 1 life due to sorrow!"
      revival
    end

    if hungry?
      if @asleep
        @asleep = false
        p "#{@name} wakes up suddenly!"
      end
      p "#{@name} is hungry!"
    end

    if thirsted?
      if @asleep
        @asleep = false
        p "#{@name} wakes up suddenly!"
      end
      p "#{@name} wants to drink!"
    end

    if angry?
      p "An irritated #{@name} has killed you in a state of affect!"
      @fin = 'exit'
      exit  #  exit the game
    end

    if sick?
      p "#{@name} has lost 1 life due to disease"
      revival
    end
        
    if two_acorn?
      p "#{@name} tries to carry 2 acorns at the same time, loses both"
      @big_acorn     = 0
      @mood         -= 1
      @irritability += 1
    end
  end

end


