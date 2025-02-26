class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        self.name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(name)
        self.all.find{|genre| genre.slug == name}
    end
end