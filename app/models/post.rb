class Post < ApplicationRecord
<<<<<<< HEAD
=======
  include AlgoliaSearch

  algoliasearch do
    attribute :title, :content, :id #, :user_id
  end

>>>>>>> fc65e697 (algo)
  validates :content, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 1 }
  belongs_to :user
  has_many :reviews
<<<<<<< HEAD
  

=======


>>>>>>> fc65e697 (algo)
    Post.where("user_id is null").each do |ps|
      ps.user_id = User.ids.sample
      ps.save
  end
end

