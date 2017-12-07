class Gathering < ActiveRecord::Base
  serialize :families, Array
end
