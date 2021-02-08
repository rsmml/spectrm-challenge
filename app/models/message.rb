class Message < ApplicationRecord
  before_create :randomize_id

  private

  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end
    while Message.where(id: self.id).exists?
  end
end
