class Flag < ActiveRecord::Base
  attr_accessible :cause, :user_id
  after_save :deactivate_user

  validates :cause, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :cause}

  belongs_to :user

  private

  def deactivate_user
  	user = self.user
  	user.activation = false
  	user.save
  end
end
