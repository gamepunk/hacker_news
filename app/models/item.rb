class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title
  validates_presence_of :url

  paginates_per 30

  def host
    array = URI.parse(url).host
  end
end
