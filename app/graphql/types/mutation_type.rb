module Types
  class MutationType < Types::BaseObject
    field :create_review_mutation, mutation: Mutations::CreateReviewMutation
    field :create_post_mutation, mutation: Mutations::CreatePostMutation
    # TODO: remove me
    field :test_field, String, null: false do
      description "An example field added by the generator"
    end
    def test_field
      "Hello World"
    end
  end

