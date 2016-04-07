class ApiTag < ActiveRecord::Base
  belongs_to :api
  belongs_to :tag
end
