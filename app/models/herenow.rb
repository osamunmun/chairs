class Herenow < ActiveRecord::Base
  attr_accessible :venue_id, :herenow
  alias_attribute :vid, :venue_id
  alias_attribute :now, :herenow
  validates_presence_of :venue_id, :herenow

  scope :recent, where(
    "created_at >= ?",
    (Time.now.getutc - 7.day).beginning_of_day
  )

  scope :old, where(
    "created_at < ?",
    (Time.now.getutc - 7.day).beginning_of_day
  )

  def self.recent_max_checkin_counts
    Herenow.recent.group(:venue_id).maximum(:herenow)
  end

  def self.remove_old_herenow
    Herenow.select(:id).old
  end
end
