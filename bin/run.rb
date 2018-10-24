require_relative '../config/environment'
system "clear"

@prompt = TTY::Prompt.new

rando_beer = Beer.find(111)
milly = Brewery.find(858)
apa = Style.find(26)

def spacing(user_input)
    good_input = user_input.split(' ').map do |word|
        word.capitalize
    end
    good_input.join(' ')
end 

def ask(question)
  @prompt.ask(question) do |q|
    q.required true
    q.modify :strip, :collapse
  end
end

def more_info(found_object)
  @prompt.select("Click to see more info:") do |options|
    found_object.collect do |p|
      options.choice p.name 
    end
  end
end

def beers_select_label(all_beers)
    x = @prompt.select("Click to see more info:") do |options| 
        all_beers.collect do |beer|
            options.choice beer.name
        end 
    end

    puts Beer.find_by(name: x).label
end

answer1 = @prompt.select("What do you want to find?", %w(Beer Brewery))

if answer1 == "Beer"
    answer2 = @prompt.select("How do you want to find a beer?", %w(Name Brewery Style Display\ All))

    case answer2 
    when "Name" 
        user_input = ask("What is the name of the beer?")
            
        x = Beer.find_by(name: spacing(user_input))
          
        puts x.label

    when "Brewery"
        user_input = ask("What is the name of the brewery?")
           
        found_brewery = Brewery.find_by(name: spacing(user_input))

        x= @prompt.select("Click to see more info:") do |options|
            found_brewery.beers.collect do |beer|
                options.choice beer.name
            end     
        end

        puts Beer.find_by(name: x).label

    when "Style"
        user_input = ask("Which style?") 
            
        found_by_style = Beer.find_by_style(spacing(user_input))
 
        x= more_info(found_by_style)
        puts Beer.find_by(name: x).label
    
    when "Display\ All"
        beers_select_label(Beer.all)
    end


elsif answer1 == "Brewery"
    answer2 = @prompt.select("How do you want to find a brewery?", %w(Name City State Country Display\ All))
    case answer2
    when "Name"
        user_input = ask("What is the name of the brewery?")
            
        x = Brewery.find_by(name: spacing(user_input))
        puts x.info

        @prompt.keypress("Press any key to see the menu")
        beers_select_label(x.beers)
    
    when "City"
        user_input = ask("What is the name of the city?")

        found_breweries = Brewery.select {|b| b.city == spacing(user_input)}

        y = more_info(found_breweries)

        z = Brewery.find_by(name: y)
        
        puts z.info
        @prompt.keypress("Press any key to see the menu")
        beers_select_label(z.beers)
    
    when "State"
        user_input = ask("What is the name of the state?")
           

        x = Brewery.select {|b| b.state == spacing(user_input)}

        y = more_info(x)
        z = Brewery.find_by(name: y)
        
        puts z.info
        @prompt.keypress("Press any key to see the menu")
        beers_select_label(z.beers)
    
    when "Country"
        user_input = ask("What is the name of the country?")
            
        x = Brewery.select {|b| b.country == spacing(user_input)}
        
        y = more_info(x)
    
        z = x.find do |brewery|
            brewery.name == y
        end 
        
        puts z.info
        @prompt.keypress("Press any key to see the menu")
        beers_select_label(z.beers)
    
    when "Display\ All"
        x = @prompt.select("Click to see more info:") do |options| 
            Brewery.all.collect do |brewery|
                options.choice brewery.name
            end 
        end
    
        z = Brewery.find_by(name: x)
        puts z.info
        @prompt.keypress("Press any key to see the menu")
        beers_select_label(z.beers)
        
    end 

end 
