module Placeholder
  extend ActiveSupport::Concern
  
  def self.image_generator(width:, hieght:)
    "https://via.placeholder.com/#{width}x#{hieght}/0000FF/808080%20?Text=Digital.com%20C/O%20https://placeholder.com/"
  end
end