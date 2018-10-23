require 'csv'
require 'pry'


# def breweries_seed
#     data = CSV.read("db/breweries.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
#     hashed_data = data.map {|d| d.to_hash}
# end 

def breweries_seed
    CSV.foreach("db/breweries.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
        Brewery.create(row.to_hash)
     end
end 

def styles_seed
        CSV.foreach("db/styles.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
            Style.create(row.to_hash)
         end
    end 

def beers_seed
    CSV.foreach("db/beers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|            
        Beer.create(row.to_hash)
end
end 

# def beers_seed
#     data = CSV.read("db/beers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
#     hashed_data = data.map {|d| d.to_hash}
# end 
# def breweries
#     CSV.foreach("db/breweries.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
#         Brewery.create(row.to_hash)
#     end
# end 

breweries_seed
styles_seed
beers_seed
