class Dataset < ApplicationRecord
  belongs_to :user
  has_many :datum
end
