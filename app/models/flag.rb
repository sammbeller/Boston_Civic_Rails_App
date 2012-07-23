class Flag < ActiveRecord::Base
  attr_accessible :cause, :user_id

  validates :cause, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :cause}

  belongs_to :user
end
