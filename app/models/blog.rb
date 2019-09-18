class Blog < ApplicationRecord
  extend FriendlyId

  validates_presence_of :title, :body

  enum status: {draft: 0, published: 1}
  friendly_id :title, use: :slugged
end
