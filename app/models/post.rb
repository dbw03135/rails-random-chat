class Post < ApplicationRecord
   belongs_to :bulletin
   has_many :comments, dependent: :destroy

   mount_uploader :picture, PictureUploader

   is_impressionable

   def self.search(search)
    where("title LIKE :search OR content LIKE :search", search:"%#{search}%")
   end

end
