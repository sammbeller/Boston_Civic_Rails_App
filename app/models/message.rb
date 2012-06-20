class Message < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true, :length => { in: 10..140 }

  belongs_to :user

end
