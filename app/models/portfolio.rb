class Portfolio < ApplicationRecord  
  # Validations
  include Placeholder

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  #Associations
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda {|attr| attr["name"].blank?}

  validates_presence_of :title, :subtitle, :body

  # Scopes
  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
  scope :order_by_position, -> { order("position ASC") }

  def self.angular
    where(subtitle: "Angular")
  end
  
  # Callbacks
  # after_initialize :set_default_image

  # def set_default_image
  #   self.main_image ||= Placeholder.image_generator(width: 600, hieght: 400)
  #   self.thumb_image ||= Placeholder.image_generator(width: 350, hieght: 200)
  # end

end
