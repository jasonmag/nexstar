class Article < ApplicationRecord

    has_one_attached :cover
    
    validates :title, :content, presence: true

    scope :published, -> {
        where.not(published_at: nil)
        .where("published_at <= ?", Time.current)
        .order(published_at: :desc)
    }
end
