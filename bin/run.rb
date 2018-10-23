require_relative '../config/environment'
prompt = TTY::Prompt.new

rando_beer = Beer.find(111)
milly = Brewery.find(858)
apa = Style.find(26)

def spacing(user_input)
    good_input = user_input.split(' ').map do |word|
        word.capitalize
    end
    good_input.join(' ')
end 

answer1 = prompt.select("What do you want to find?", %w(Beer Brewery))

if answer1 == "Beer"
    answer2 = prompt.select("How do you want to find a beer?", %w(Name Brewery Style))

    case answer2 
    when "Name" 
        user_input = prompt.ask("What is the name of the beer?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 
            
        x = Beer.find_by(name: spacing(user_input))
        
        prompt.select("Click to see more info:") do |options|
            options.choice "#{x.name}", 1
        end 
        puts x.label

    when "Brewery"
        user_input = prompt.ask("What is the name of the brewery?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 

        found_brewery = Brewery.find_by(name: spacing(user_input))

        x= prompt.select("Click to see more info:") do |options|
            found_brewery.beers.collect do |beer|
                options.choice beer.name
            end     
        end 

        
         puts Beer.find_by(name: x).label

    when "Style"
        user_input = prompt.ask("Which style?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 
        found_by_style = Beer.find_by_style(spacing(user_input))

        x= prompt.select("Click to see more info:") do |options|
            found_by_style.collect do |beer|
                options.choice beer.name
            end     
        end 
            puts Beer.find_by(name: x).label

    end


elsif answer1 == "Brewery"
    answer2 = prompt.select("How do you want to find a brewery?", %w(Name City State Country))
    case answer2
    when "Name"
        user_input = prompt.ask("What is the name of the brewery?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 

        x = Brewery.find_by(name: spacing(user_input))
        puts x.info

        prompt.keypress("Press any key to see the menu")
        puts x.menu
    
    when "City"
        user_input = prompt.ask("What is the name of the city?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 

        x = Brewery.select {|b| b.city == spacing(user_input)}
        # binding.pry
        
        y = prompt.select("Click to see more info:") do |options|
                x.collect do |brewery|

            options.choice brewery.name
            end     
         end 

        
        z = x.find do |brewery|
            brewery.name == y
        end 
        
        puts z.info
        prompt.keypress("Press any key to see the menu")
        puts z.menu
    
    when "State"
        user_input = prompt.ask("What is the name of the state?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 

        x = Brewery.select {|b| b.state == spacing(user_input)}
        # binding.pry
        
        y = prompt.select("Click to see more info:") do |options|
                x.collect do |brewery|

            options.choice brewery.name
            end     
         end 

        
        z = x.find do |brewery|
            brewery.name == y
        end 
        
        puts z.info
        prompt.keypress("Press any key to see the menu")
        puts z.menu
    
    when "Country"
        user_input = prompt.ask("What is the name of the country?") do |q|
            q.required true
            q.modify :strip, :collapse
        end 

        x = Brewery.select {|b| b.country == spacing(user_input)}
        # binding.pry
        
        y = prompt.select("Click to see more info:") do |options|
                x.collect do |brewery|

            options.choice brewery.name
            end     
         end 

        
        z = x.find do |brewery|
            brewery.name == y
        end 
        
        puts z.info
        prompt.keypress("Press any key to see the menu")
        puts z.menu

    end 

end 
