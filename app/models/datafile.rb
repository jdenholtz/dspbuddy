class Datafile < ApplicationRecord
  belongs_to :dataset

  mount_uploader :datafile, DatafileUploader
  
end
