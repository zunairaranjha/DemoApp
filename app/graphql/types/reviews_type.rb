# frozen_string_literal: true

module Types
  class ReviewsType < Types::BaseObject
    field :rating, Types::IntegerType
    field :coment, String
    field :post, [PostType], null: true

  end
end
