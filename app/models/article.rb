class Article < ApplicationRecord

has_many :article_tags
has_many :tags, through: :article_tags


has_many :comments, dependent: :destroy

validates :title, presence: true,
                    length: { minimum: 5 }
 
 has_many :my_topics, dependent: :destroy
end
