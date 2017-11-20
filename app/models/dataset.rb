class Dataset < ApplicationRecord
  belongs_to :user
  has_many :datum
  mount_uploader :datafile, DatafileUploader
end
