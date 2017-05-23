class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  # validates :release_year, presence: true, if: :release?
  validates_uniqueness_of :title, :scope => :release_year
  # validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }


  with_options if: :released do |song|
     song.validates :release_year, presence: true
     song.validates :release_year, numericality: {
       less_than_or_equal_to: Time.now.year
     }
   end


end
