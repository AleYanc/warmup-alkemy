class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates_format_of :img,
  :multiline => true ,
  :with    => %r{(gif|jpe?g|png)$}i,
  :message => "must have an image extension"
  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :content, presence: true, length: {minimum:3, maximum:500}
  validates :img, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
  
  scope :by_title, -> title {where("title LIKE ?", "%" + title + "%")}
  scope :by_category, -> category {where("category LIKE ?", "%" + category + "%")}

end
