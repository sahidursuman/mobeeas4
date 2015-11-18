class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile
  belongs_to :opportunity
end
