class Post < ActiveRecord::Base
  attr_accessor :key
  
  validate :key_must_be_valid
  
  def key_must_be_valid
    if key != Rails.configuration.post_key
      errors.add(:key, 'invalid key')
    end
  end
  
  def posted_at_formatted
    posted_at.strftime('%B %e, %Y')
  end
end
