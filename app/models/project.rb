class Project < ActiveRecord::Base
  # relationships
  has_many :tasks

  def done?
    self.tasks.reject(&:complete?).empty?
  end

  def total_hours
    self.tasks.inject(0) { |total, task| total += task.total_hours }
  end

  def remaining_hours
    remaining = 0
   self.tasks.each do |t|
     remaining += t.total_hours - t.completed_hours unless t.is_complete
   end
   remaining
  end
end
