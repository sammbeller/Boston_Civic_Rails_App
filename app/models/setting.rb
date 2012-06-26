class Setting < ActiveRecord::Base
  attr_accessible :name, :prompt, :value
end
