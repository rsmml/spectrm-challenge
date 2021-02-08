class Message < ApplicationRecord
  require "securerandom"
  before_create :randomize_id

  validates_format_of :body, :with => /\A[\A\-]*/, on: :create
  validates_length_of :body, :maximum => 255

  private

  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while self.class.where(id: self.id).exists?
  end
end
