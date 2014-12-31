require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "init" do
    let(:task) { Task.new }

    it "can destinguish a completed task" do
      expect(task).not_to be_complete
      task.mark_completed
      expect(task).to be_complete
    end
  end
end
