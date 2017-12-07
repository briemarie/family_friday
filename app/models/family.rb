class Family < ActiveRecord::Base
  serialize :members, Array
end
