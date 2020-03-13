class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id, dependent: :delete_all
end
