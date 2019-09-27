class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates_presence_of :name

  #Virtual attributes
  def first_name
    self.name.present? ? self.name.split.first : "User"
  end

  def last_name
    self.name.present? ? self.name.split.last : "User"
  end
end
