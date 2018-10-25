ruby bin/run.rb to begin

#Intro
This is a simple CLI app to query a beer database. The database was seeded via CSV, containing over 7,000 beers from around the world. In this database, we are dealing with a many-to-many relationship: a brewery produces many beers, and each beer has one style. In this way, a brewery has many styles through their beers.
A user may search for a beer in a varierty of ways.


#Find Beer
-Search for a beer by exact name
-Search for a beer by exact brewery name
-Search for a beer by exact style name
-You may input 'back' or 'exit' at any time during the search prompts to either return to the top level or quit
-Display all beers (with filter as you type)

#Find Brewery
-Search for a brewery by exact name
-Search for a brewery by exact city
-Search for a brewery by exact state
-Search for a brewery by exact country
-You may input 'back' or 'exit' at any time during the search prompts to either return to the top level or quit
-Display all breweries (with filter as you type)
-After finding a brewery and viewing its information, press any key to be taken to a list of all its beers
-You may then view info on any one beer before being taken back to start

#Browse By Style
-Display all styles of beers
-Selecting a style displays a list of all beers of that type (with filter as you type)
-You may then view info on any one beer before being taken back to start

#Exit
-Exit the CLI

