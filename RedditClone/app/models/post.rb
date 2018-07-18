class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: true 
  
  has_many :post_subs, inverse_of: :post,
    foreign_key: :post_id,
    class_name: :PostSub 
    
  has_many :subs,
    through: :post_subs,
    source: :sub
    
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
    
  has_many :comments,
    foreign_key: :post_id,
    class_name: :Comment
    
  
end 