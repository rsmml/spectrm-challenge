class Message < ApplicationRecord
  require 'securerandom'
  before_create :randomize_id

  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/
  LINK_REGEX  = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/
  validates :body, format: { with: /\A[\A\-]*/ }, presence: true
  validates :body, format: { without: /<.+?>/, message: "No HTML <tags />" }
  validates :body, length: { maximum: 255 }

  private

  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while self.class.where(id: self.id).exists?
  end
end
