class Product < ApplicationRecord
  validates_presence_of :title, :description, :price, :category
  has_many :items
end
