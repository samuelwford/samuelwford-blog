class Post < ActiveRecord::Base
  attr_accessor :key
  
#  validates :slug, presence: true, uniqueness: true
  validate :key_must_be_valid
  
  def slug_or_id
    slug? ? slug : id
  end
  
  def key_must_be_valid
    if key != Rails.configuration.post_key
      errors.add(:key, 'invalid key')
    end
  end
  
  def posted_at_formatted
    posted_at.strftime('%B %e, %Y')
  end
end
