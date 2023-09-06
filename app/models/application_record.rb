class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def readonly?
    true
  end
end
