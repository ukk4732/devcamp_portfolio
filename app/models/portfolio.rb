class Portfolio < ApplicationRecord  
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  def self.angular
    where(subtitle: "Angular")
  end

  after_initialize :set_default_image

  def set_default_image
    self.main_image ||= "https://via.placeholder.com/600x400/0000FF/808080%20?Text=Digital.com%20C/O%20https://placeholder.com/"
    self.thumb_image ||= "https://via.placeholder.com/350x200/0000FF/808080%20?Text=Digital.com%20C/O%20https://placeholder.com/"
  end

end
