class User < ActiveRecord::Base
  has_many :scores
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}\z/
  validates_uniqueness_of :email, presence: true
  has_secure_password
end
