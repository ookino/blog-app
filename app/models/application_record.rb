class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def current_user
    User.limit(1)
  end
end
