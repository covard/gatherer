class Project < ActiveRecord::Base
  # relationships
  has_many :tasks

  def done?
    self.tasks.reject(&:complete?).empty?
  end
end
