class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer     :project_id
      t.string      :title
      t.text        :description
      t.float       :total_hours
      t.float       :completed_hours
      t.boolean     :is_complete, default: false

      t.timestamps null: false
    end
    add_index :tasks, :project_id
  end
end
