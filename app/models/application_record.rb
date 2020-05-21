class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true #don't want this class to be considered as part of the STI hierarchy
end
