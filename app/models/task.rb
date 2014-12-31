class Task < ActiveRecord::Base
  # relationships
  belongs_to :project

  # scopes
  scope :incomplete, -> { where(is_complete: false) }
  scope :complete, -> { where(is_complete: true) }

  def mark_completed
    self.is_complete = true
    self.save
  end

  def complete?
    self.is_complete
  end
end
