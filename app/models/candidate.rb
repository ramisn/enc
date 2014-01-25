class Candidate < ActiveRecord::Base

  mount_uploader :cv, CvUploader
end
