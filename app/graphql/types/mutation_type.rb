# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :complete_task, Types::TaskType, null: true do
      description "Mark a task as complete"
      argument :id, ID
      argument :complete, Boolean
    end

    field :relabel_task, Types::TaskType, null: true do
      description "Update a task's label"
      argument :id, ID
      argument :label, String
    end

    def complete_task(id:, complete:)
      # TODO how should we be handling invalid IDs?
      task = ::Task.find(id)
      task.update(complete: complete)
      task
    end

    def relabel_task(id:, label:)
      # TODO how should we be handling invalid IDs?
      task = ::Task.find(id)
      task.update(label: label)
      task
    end
  end
end
