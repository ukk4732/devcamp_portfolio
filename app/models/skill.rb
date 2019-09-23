class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilize

  #Callback
  after_initialize :set_default_image

  def set_default_image
    self.badge ||= Placeholder.image_generator(width: 200, hieght: 200)
  end
end