# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false do
    description "This post's id."
  end
  
    field :title, String do
      description "This post's title."
    end

    field :content, String do
      description "This post's content."
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This post's created at."
    end

    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false do
      description "This post's updated at."
    end
    field :user_id, Integer
   
  end
end
