class TagRelationship < ActiveRecord::Base
  has_many :taggings
   
  validates_numericality_of :distance, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 3

  # required synonym relationship, if it doesn't exist, create it.
  def self.synonym
    find_by_name('synonym') || TagRelationship.create({ :name => 'synonym', :verb_phrase => "is another name for", :reciprocal => true, :distance => 0 })
  end

  # required disambiguate relationship, if it doesn't exist, create it.
  def self.disambiguate
    find_by_name('disambiguate') || TagRelationship.create({ :name => 'disambiguate', :verb_phrase => "might refer to", :reciprocal => true, :distance => 0 })
  end

end
