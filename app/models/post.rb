class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :post_comments
  has_many :favorites
  attachment :image
  
  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(keyword)
    where(["body like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
end
