class Label < ApplicationRecord
  has_many :tasks
    
  before_create :slugify

  def slugify 
      self.slug = title.parameterize
  end

  belongs_to :user
end
