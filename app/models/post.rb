class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates  :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait?

    CLICKBAITS = [ 
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
     ]
    
    def title_is_clickbait?
        if CLICKBAITS.none? {|t| t.match title}
            errors.add(:title, "must be a clickbait")
        end
    end
end
