class Cafe < ActiveRecord::Base
  attr_accessible :venue_id, :full, :herenow, :image, :location, :name
  alias_attribute :vid, :venue_id
  alias_attribute :now, :herenow

  default_scope order('name ASC')

  def full?
    full
  end
end
