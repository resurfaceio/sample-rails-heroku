# frozen_string_literal: true

module Types
  module Input
    class NoteInputType < Types::BaseInputObject
      argument :title, String, required: true
      argument :body, String, required: true
    end
  end
end
