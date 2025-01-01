class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photograph
end
