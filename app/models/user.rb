class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
   has_secure_password
   
   has_many :coordinates
   has_many :favorites
   has_many :likes, through: :favorites, source: :coordinate


  def fav(coordinate)
    self.favorites.find_or_create_by(coordinate_id: coordinate.id)
  end
  
  def unfav(coordinate)
    favorite = self.favorites.find_by(coordinate_id: coordinate.id)
    favorite.destroy if favorite
  end
  
  def liking?(coordinate)
    self.likes.include?(coordinate)
  end  
  
  def feed_coordinates
    Coordinate.all
  end  

end    