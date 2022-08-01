module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :posts, [Types::PostType], null: false do
      description: "Query that select all posts."
    end
    field :postsCount, Integer, null: false do
      description: "Query that returns total no of posts."
    end

    def posts
      return  Post.all
    end

    def posts
      return  Post.count
    end
  end

end
