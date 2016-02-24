class ExpressionOfInterest < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :opportunity
end
