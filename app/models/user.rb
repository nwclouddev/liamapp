class User < ApplicationRecord
  belongs_to :organization
  belongs_to :store

  has_many :ahoy_events
  has_many :ahoy_visits

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
