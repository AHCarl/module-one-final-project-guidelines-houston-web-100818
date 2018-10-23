class Style < ActiveRecord::Base
has_many :beers
has_many :breweries, through: :beers

def self.most_common
  var = Beer.group(:style_id).select(:style_id).order("count(*) desc").second
  Style.find(var.style_id)
end

def number_of_beers
  Beer.all.where(style_id: self.id).count
end

end