class Cohort < ActiveRecord::Base
  belongs_to :course
  has_one :instructor
end
