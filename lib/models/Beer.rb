class Beer < ActiveRecord::Base
belongs_to :brewery
belongs_to :style

def label
  str = "#{self.name} from #{self.brewery.name}"
  if self.has_style?
    str += ", a #{self.style.style_name}."
  end
  if self.has_abv?
    str += " #{self.abv} abv."
  end
  if self.has_ibu?
    str += " #{self.ibu} ibu."
  end
  if self.descript != nil 
    str += " #{self.descript}"
  end
  str
end

def has_abv?
  self.abv != 0.0
end

def has_ibu?
  self.ibu != 0.0
end

def has_descript?
  self.descript != nil 
end

def has_style?
  self.style_id != -1
end

def has_name?
  self.name != nil
end

def self.find_by_style(style_name)
  s = Style.find_by(style_name: style_name)
  Beer.select{ |beer| beer.style_id == s.id}
end
    

end