class Whiskey < ApplicationRecord
    validates_uniqueness_of :title
    validates_presence_of :title, :taste, :color, :smokiness

  def self.get_whiskeys_param_ordered(param_name)
    self.order("#{param_name}")
  end
end
