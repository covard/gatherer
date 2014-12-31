class Task < ActiveRecord::Base
  # relationships
  belongs_to :project

  def mark_completed
    self.is_complete = true
    self.save
  end

  def complete?
    self.is_complete
  end

end
