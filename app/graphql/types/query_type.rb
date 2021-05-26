module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_notes, resolver: Queries::FetchNotes
    field :fetch_note, resolver: Queries::FetchNote
  end
end
