class Message < ApplicationRecord
  mount_uploaders :Pics, PicUploader
  belongs_to :user
  belongs_to :chat_room

  #validates :body, presence: true, length: {minimum: 1, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
