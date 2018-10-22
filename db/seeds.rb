require 'csv'
require 'pry'

def please_give_data
data = CSV.read("data.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
hashed_data = data.map {|d| d.to_hash}
end 

please_give_data
binding.pry