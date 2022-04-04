require 'mail'

class Invitation < ApplicationRecord
  belongs_to :cycle
  before_validation :format_email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email format' }

  def format_email
    email_field = Mail::Address.new(self.email)
    self.email = email_field.address   # ex: "john@example.com"
    self.name = email_field.display_name   # ex: "John Doe"
    generate_name(email_field.local) if self.name.nil?
  end

  def generate_name(email)
    generated_name = email.split('.').map do |name|
      name.gsub!(/\d+/, '')
      name.capitalize
    end
    self.name = generated_name.join(' ')
  end
end
