# frozen_string_literal: true

module Mutations
  class AddNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteInputType, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:)
      note_params = Hash params

      begin
        note = Note.create!(note_params)

        { note: note }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
