class Message < ActiveRecord::Base
  attr_accessible :content, :user_id

  validates :content, presence: true, :length => { in: 10..140 }

  belongs_to :user

end
