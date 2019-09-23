class Portfolio < ApplicationRecord  
  # Validations
  include Placeholder

  #Associations
  has_many :technologies

  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  # Scopes
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  def self.angular
    where(subtitle: "Angular")
  end
  
  # Callbacks
  after_initialize :set_default_image

  def set_default_image
    self.main_image ||= Placeholder.image_generator(width: 600, hieght: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, hieght: 200)
  end

end
