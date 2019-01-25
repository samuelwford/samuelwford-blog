class Image < ActiveRecord::Base
  attr_accessor :key
  has_attached_file :file, styles: { thumb: "100x100>" }
  
  has_one_attached :picture
  
  validate :key_must_be_valid
  
  def key_must_be_valid
    logger.debug Rails.configuration.post_key
    if key != Rails.configuration.post_key
      errors.add(:key, 'invalid key')
    end
  end
end
