class Post < ActiveRecord::Base
  paginates_per 5
  has_many :comments, :dependent => :delete_all

  acts_as_taggable

  validates :title, :presence => true
  validates :body, :presence => true
end
