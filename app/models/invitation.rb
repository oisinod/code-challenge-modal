class Invitation < ApplicationRecord
  belongs_to :cycle
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email format' }
end
