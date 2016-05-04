class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :link
  self.per_page = 10
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :body
end
