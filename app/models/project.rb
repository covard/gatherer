class Project < ActiveRecord::Base
  # relationships
  has_many :tasks

  def done?
    self.tasks.blank?
  end
end
