# frozen_string_literal: true

module Queries
  class FetchNotes < Queries::BaseQuery

    type [Types::NoteType], null: false

    def resolve
      Note.all.order(created_at: :desc)
    end
  end
end
