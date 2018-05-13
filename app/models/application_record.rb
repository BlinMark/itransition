class ApplicationRecord < ActiveRecord::Base
  acts_as_commentable
  self.abstract_class = true
end
