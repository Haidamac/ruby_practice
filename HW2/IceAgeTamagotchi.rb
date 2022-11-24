p 'Hi! I\'m saber-toothed squirrel Scrat from Ice Age! Let\'s go!!!' 

class STSquirrel

    def initialize name
        @name          = name
        @genus         = 'Saber-Toothed Squirrel'
        @life          = 9           #  як і у кота - 9 життів  
        @mood          = 5           #  Настрій бадьорий  
        @satiety       = 10          #  Він не голодний  
        @thirst        = 7           #  Його не мучить спрага 
        @weariness     = 0           #  Він не втомлений
        @asleep        = false       #  Він не спить
        @irritability  = 3           #  Він трішки роздратований, бо не має жолудя
        @health        = 10          #  Він здоровий 
        @bigAcorn      = 0           #  Він не має великого жолудя
        @lastFeedTime  = Time.now()  #  Щойно нагодований
        @lastDrinkTime = Time.now()  #  Щойно попив води
        @lastRestTime  = Time.now()  #  Щойно відпочив
        @fin           = ''          #  маркер закінчення циклу меню 
    end
      
    def giveFood
        p 'Годуємо ' + @name + 'а.'
        @satiety += 3
        @lastFeedTime = Time.now()
        indicator
    end
      
    def giveWater
        p 'Напуваємо ' + @name + 'а.'
        @thirst += 1
        @lastDrinkTime = Time.now()
        indicator
    end
      
    def putToCave
        p 'Кладемо ' + @name + 'а в дупло спати'
        if @bigAcorn == 1 && @weariness > 5
            @asleep       = true
            @irritability = 0
            @weariness   -= 1
            3.times do
              if @asleep
                passageOfTime
              end
              if @asleep
                p @name + ' впускає з рук жолудь'
                @lastRestTime  = Time.now()
              end
            end
            if @asleep
              @asleep       = false
              @mood         -= 1
              @irritability += 1
              p @name + ' вискакує з дупла у пошукуах жолудя'
            end
        else
          if @bigAcorn < 1
            p 'Без жолудя ' + @name + ' не засне'
          else
            p @name + ' не хоче спати'
          end
          @asleep = false
          @mood  -= 1
        end
    end
      
    def giveCure
        p 'Лікуємо ' + @name
        @health += 1
        indicator
    end
      
    def giveAcorn
        p 'Даємо ' + @name + 'у великий жолудь.'
        @bigAcorn     += 1
        @irritability = 0
        @mood         = 5
        p 'Радісний ' + @name + ' біжить його ховати'
        incident
    end  

    def yourChoice
      until @fin == 'exit'  
        p 'Type what you want to do. Or help / or quit'
        command = gets.chomp.downcase
        case command
        when 'feed'
          giveFood
        when 'water'  
          giveWater
        when 'bed'  
          putToCave
        when 'cure'
          giveCure
        when 'acorn'
          giveAcorn
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

    def indicator
      p 'life:         ' + @life.to_s
      p 'health:       ' + @health.to_s
      p 'mood:         ' + @mood.to_s
      p 'satiety:      ' + @satiety.to_s
      p 'thirst:       ' + @thirst.to_s
      p 'weariness:    ' + @weariness.to_s
      p 'irritability: ' + @irritability.to_s
      p 'acorn:        ' + @bigAcorn.to_s
      yourChoice
    end
    
    def help
      p 'Type \'FEED\' to feed Scrat'
      p 'Type \'WATER\' to water Scrat'
      p 'Type \'BED\' to put Scrat asleep'
      p 'Type \'CURE\' to cure Scrat'
      p 'Type \'ACORN\' for give the Big Acorn to Scrat'
      p 'Type \'QUIT\' for exit from game'
      p 'no matters upper- or lowercase'
    end

    private
      
    def moody?   #  сумний?
        @mood < 1
    end

    def hungry?  #  голодний?
        @satiety <= 3
    end
      
    def thirsted?  #відчуває спрагу?
        @thirst <= 2
    end

    def angry?  #роздратований?
        @irritability > 10
    end

    def sick?  #хворий?
        @health < 1
    end

    def twoAcorn?  # у білки опиняється 2 жолуді
        @bigAcorn > 1
    end  

    def incident  # з білкою трапляється пригода, коли вона намагається заховати жолудь
        @bigAcorn > 0 && @asleep = false && @weariness < 7
        inc = rand(14)
          case inc
          when 0, 2, 4, 8, 10, 12, 13
            p @name + ' намагається заховати жолудь, але у нього це не виходить'
            @irritability += 1
            @mood         -= 1
            @weariness    += 1
            passageOfTime 
          when 1
            p @name + ' потрапив під лавину'
            @health       -= 3
            @bigAcorn      = 0
            @mood         -= 2
            @irritability += 3
            indicator
          when 3
            p @name + ' провалився під кригу'
            @health       -= 2
            @bigAcorn      = 0
            @mood         -= 2
            @irritability += 2
            indicator
          when 5
            p @name + ' зірвався зі скелі'
            @health       -= 4
            @bigAcorn      = 0
            @mood         -= 2
            @irritability += 3
            indicator
          when 7
            p 'У ' + @name + 'а вдарила блискавка'
            @health       -= 5
            @bigAcorn      = 0
            @mood         -= 3
            @irritability += 3
            indicator
          when 9
            p @name + ' вступив в бій з піраньями'
            @health       -= 1
            @bigAcorn      = 0
            @mood         += 2
            @irritability -= 1
            indicator
          when 11
            p @name + ' опинився в космосі'
            @bigAcorn     = 0
            @life -= 1
            indicator
          end
    end

    def passageOfTime # проходить деякий час
        if @life < 1
          p @name + ' помирає :((('
          @fin = 'exit'
          exit  #  Вихід з гри  
        end
        
        if @satiety > 0
          if @lastFeedTime - Time.now() > 14400
            @satiety -= 3 
          end  
        else  #  Білка страждає від голоду!
          if @asleep
            @asleep = false
            p @name + 'Раптово прокидається!'
          end
          p 'Голодний' + @name + ' Вас з\'їдає!'
          @fin = 'exit'
          exit  #  Вихід з гри
        end
        
        if @thirst > 0
          if @lastDrinkTime - Time.now() > 7200
            @thirst -= 1
          end
        else # Білка страждає від спраги
          p @name + ' втрачає 1 життя через спрагу!'
          @life   -= 1
          @health  = 10
          @thirst  = 7 
        end

        if @weariness < 10
          if @lastRestTime - Time.now() > 7560
            @weariness += 1
          end
        else # Білка виснажена
          p @name + ' втрачає 1 життя через виснаження'
          @life     -= 1
          @health    = 10
          @weariness = 0   
        end
        
        if moody?
          p @name + ' втрачає 1 життя через сум!'
          @life   -= 1
          @health  = 10
          @mood    = 5
        end

        if hungry?
          if @asleep
            @asleep = false
            p @name + 'Раптово прокидається!'
          end
          p @name + ' Голодний!'
        end

        if thirsted?
          if @asleep
            @asleep = false
            p @name + 'Раптово прокидається!'
          end
          p @name + ' Хоче пити!'
        end

        if angry?
          p 'Роздратований' + @name + ' вбиває Вас в стані афекту!'
          @fin = 'exit'
          exit  #  Вихід з гри
        end

        if sick?
          p @name + ' втрачає 1 життя через хворобу'
          @life     -= 1
          @health    = 10
        end
        
        if twoAcorn?
          p @name + ' намагається одночасно нести 2 жолуді, обидва втрачає'
          @bigAcorn      = 0
          @mood         -= 1
          @irritability += 1

        end
      end
        
  pet = STSquirrel.new 'Scrat'
  pet.indicator
end           



