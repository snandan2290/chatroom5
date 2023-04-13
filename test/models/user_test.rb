require 'test_helper'

class UserTest < ActiveSupport::TestCase

  validates :user, presence: true, length: {minimum:3, maximum:25}, unique: true
  has_secure_password

end
