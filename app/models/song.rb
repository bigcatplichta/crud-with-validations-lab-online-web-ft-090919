class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Artist can't release song with same title in same year"}

    def released?
        released 
    end
end
