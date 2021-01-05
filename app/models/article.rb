class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  validates :title, presence: true
  
  has_rich_text :content
end
