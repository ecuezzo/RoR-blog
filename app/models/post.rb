class Post < ActiveRecord::Base
  paginates_per 5
  has_many :comments

  validates :title, :presence => true
  validates :body, :presence => true
end
