class User < ApplicationRecord
  include Clearance::User

  include Clearance::User
  has_many :students
  has_many :instructors
  has_many :administrators
end
