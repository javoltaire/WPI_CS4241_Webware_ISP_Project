class Note < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence:true, length: {maximum: 150}
  validates :content, presence: true

end
