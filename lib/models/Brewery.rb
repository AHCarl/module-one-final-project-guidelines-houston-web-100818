class Brewery < ActiveRecord::Base
  has_many :beers 
  has_many :styles, through: :beers 

  def self.most_beers
    var = Beer.group(:brewery_id).select(:brewery_id).order("count(*) desc").first
    Brewery.find(var.brewery_id)
  end

  def number_of_beers
    Beer.all.where(brewery_id: self.id).count
  end

end