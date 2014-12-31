require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "initialization" do
    let(:project) { Project.new }
    let(:task) { Task.new }

    it "considers a project with no tasks to be done" do
      expect(project).to be_done
    end

    it "considers a project with an incomplete task is not done" do
      project.tasks << task
      expect(project).not_to be_done
    end

    it "marks a project done if it's tasks are done" do
      project.tasks << task
      task.mark_completed
      expect(project).to be_done
    end
  end

  describe "estimates" do
    let(:project) { Project.new }
    let(:done) { Task.new(total_hours: 2, completed_hours: 2, is_complete: true) }
    let(:small_not_done) { Task.new(total_hours: 1) }
    let(:large_not_done) { Task.new(total_hours: 4) }

    before(:example) do
      project.tasks = [done, small_not_done, large_not_done]
    end

    it "can calucalte total size" do
      expect(project.total_hours).to eq(7)
    end

    it "can calculate remaning size" do
      expect(project.remaining_hours).to eq(5)
    end
  end
end
