class SetHoursDefaults < ActiveRecord::Migration
  def change
    change_column :tasks, :total_hours, :integer, default: 0
    change_column :tasks, :completed_hours, :integer, default: 0
  end
end
