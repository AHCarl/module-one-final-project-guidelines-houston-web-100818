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

  def menu 
    r = self.beers.map do |beer|
      str = "#{beer.name}"
      if beer.has_style?
        str += " - #{beer.style.style_name}"
      end
    end
    r.compact
  end

  def info
    self.attributes.map do |key, value|
      if key != "id"
        value
      end 
    end 
  end  

end